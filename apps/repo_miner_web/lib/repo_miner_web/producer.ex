defmodule RepoMinerWeb.Producer do
  @moduledoc """
    RabbitMQ Producer Client  
  """

  use GenServer
  use AMQP

  @exchange "repo_miner_exchange"
  @queue "repo_miner_queue"

  def send(pid, action, repo_inf) do
    GenServer.cast(pid, {action, repo_inf})
  end

  def init(_) do
    {:ok, channel} = AMQP.Application.get_channel(:chan)
    AMQP.Queue.declare(channel, @queue)
    AMQP.Exchange.declare(channel, @exchange)
    AMQP.Queue.bind(channel, @queue, @exchange)
    {:ok, channel}
  end

  def handle_cast({:analyze, repo_inf}, channel) do
    repo_inf = Jason.encode!(repo_inf)
    AMQP.Basic.publish(channel, @exchange, "", repo_inf)
    IO.puts("Analyzing public repo sended")
    {:noreply, :ok}
  end
end
