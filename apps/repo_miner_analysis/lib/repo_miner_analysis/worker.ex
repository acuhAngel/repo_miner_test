defmodule RepoMinerAnalysis.Worker do
  @moduledoc """
    Repo Analyzer process pool worker.
  """

  use GenServer
  use AMQP

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil)
  end

  @exchange "repo_miner_exchange"
  @queue "repo_miner_queue"
  @queue_error "#{@queue}_error"

  def init(_) do
    {:ok, connection} = AMQP.Application.get_connection(:conn)
    {:ok, channel} = Channel.open(connection)
    setup_queue(channel)
    {:ok, _consumer_tag} = Basic.consume(channel, @queue)
    {:ok, channel}
  end

  # Confirmation sent by the broker after registering this process as a consumer
  def handle_info({:basic_consume_ok, %{consumer_tag: _consumer_tag}}, chan) do
    {:noreply, chan}
  end

  def handle_info(
        {:basic_deliver, payload, %{delivery_tag: tag, redelivered: redelivered}},
        channel
      ) do
    consume_payload(channel, payload, redelivered, tag)
  end

  defp setup_queue(channel) do
    {:ok, _} = Queue.declare(channel, @queue_error)
    :ok = Exchange.fanout(channel, @exchange)
    :ok = Queue.bind(channel, @queue, @exchange)
  end

  defp consume_payload(channel, _payload, _redelivered, tag) do
    :ok = Basic.ack(channel, tag)

    # Here is where repo_miner_py will be called

    IO.puts("Consumed payload. #{inspect(self())}")
    Process.sleep(10_000)
    {:noreply, channel}
  end
end
