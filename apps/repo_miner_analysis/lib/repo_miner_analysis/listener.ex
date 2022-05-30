defmodule RepoMinerAnalysis.Listener do
  @moduledoc """
    This module is a subscriber of a RabbitMQ Queue
  """

  use GenServer
  use AMQP

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], [])
  end

  @exchange "repo_miner_exchange"
  @queue "repo_miner_queue"

  def init(_opts) do
    {:ok, connection} = AMQP.Application.get_connection(:conn)
    {:ok, channel} = Channel.open(connection)
    setup_queue(channel)
    {:ok, _consumer_tag} = Basic.consume(channel, @queue)
    {:ok, channel}
  end

  # Confirmation sent by the broker after registering this process as a consumer
  def handle_info({:basic_consume_ok, %{consumer_tag: _consumer_tag}}, channel) do
    {:noreply, channel}
  end

  # Sent by the broker when the consumer is unexpectedly cancelled (such as after a queue deletion)
  def handle_info({:basic_cancel, %{consumer_tag: _consumer_tag}}, channel) do
    {:stop, :normal, channel}
  end

  # Confirmation sent by the broker to the consumer process after a Basic.cancel
  def handle_info({:basic_cancel_ok, %{consumer_tag: _consumer_tag}}, channel) do
    {:noreply, channel}
  end

  def handle_info(
        {:basic_deliver, payload, %{delivery_tag: tag, redelivered: redelivered}},
        channel
      ) do
    consume(channel, tag, redelivered, payload)
    {:noreply, channel}
  end

  defp consume(channel, tag, _redelivered, payload) do
    case Jason.decode(payload) do
      {:ok, repo_map} ->
        :ok = Basic.ack(channel, tag)
        IO.puts("Received")
        :poolboy.transaction(:worker, fn pid -> GenServer.cast(pid, {:analyze, repo_map}) end)

      {:error, _} ->
        :ok = Basic.reject(channel, tag, requeue: false)
    end
  end

  defp setup_queue(channel) do
    {:ok, _} = Queue.declare(channel, @queue)
    :ok = Exchange.fanout(channel, @exchange)
    :ok = Queue.bind(channel, @queue, @exchange)
  end
end
