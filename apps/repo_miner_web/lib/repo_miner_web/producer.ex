defmodule RepoMinerWeb.Producer do
  @moduledoc """
    RabbitMQ Producer Client  
  """
  use GenServer
  use AMQP

  @exchange "repo_miner_exchange"
  @queue "repo_miner_queue"

  def start_link(name: name) do
    GenServer.start_link(__MODULE__, [], name: name)
  end

  def send(pid, action, repo_inf) do
    GenServer.cast(pid, {action, repo_inf})
    :ok
  end

  def init(_) do
    {:ok, channel} = AMQP.Application.get_channel(:chan)
    Queue.declare(channel, @queue)
    Exchange.fanout(channel, @exchange)
    Queue.bind(channel, @queue, @exchange)
    {:ok, channel}
  end

  def handle_cast({:analyze, repo_inf}, channel) do
    repo_inf = Jason.encode!(repo_inf)
    Basic.publish(channel, @exchange, "", repo_inf)
    {:noreply, channel}
  end
end
