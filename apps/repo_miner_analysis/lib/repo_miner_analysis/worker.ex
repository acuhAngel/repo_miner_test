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

  def init(_) do
    {:ok, connection} = AMQP.Application.get_connection(:conn)
    {:ok, channel} = Channel.open(connection)
    setup_queue(channel)
    {:ok, _consumer_tag} = Basic.consume(channel, @queue)
    {:ok, miner_py_pid} = RepoMinerPy.RepoMiner.start_link(name: nil)
    {:ok, %{channel: channel, miner_py_pid: miner_py_pid}}
  end

  # Confirmation sent by the broker after registering this process as a consumer
  def handle_info({:basic_consume_ok, %{consumer_tag: _consumer_tag}}, state) do
    {:noreply, state}
  end

  def handle_info(
        {:basic_deliver, payload, %{delivery_tag: tag, redelivered: redelivered}},
        state
      ) do
    consume_payload(state, payload, redelivered, tag)
  end

  defp setup_queue(channel) do
    {:ok, _} = Queue.declare(channel, @queue)
    :ok = Exchange.fanout(channel, @exchange)
    :ok = Queue.bind(channel, @queue, @exchange)
  end

  defp consume_payload(state, payload, _redelivered, tag) do
    :ok = Basic.ack(state.channel, tag)
    repo_map = Jason.decode!(payload)

    result =
      GenServer.call(
        state.miner_py_pid,
        {:analyze, repo_url: repo_map["repo_url"], token: repo_map["token"]},
        60_000
      )

    case result do
      {:ok, _repo_info} ->
        # Write result and successful state to database
        :ok

      {:error, _error_msg} ->
        # write error state to database
        :error
    end

    {:noreply, state}
  end
end
