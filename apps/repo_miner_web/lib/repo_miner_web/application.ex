defmodule RepoMinerWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      RepoMinerWebWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: RepoMinerWeb.PubSub},
      # Start the Endpoint (http/https)
      RepoMinerWebWeb.Endpoint,
      # Start a worker by calling: RepoMinerWeb.Worker.start_link(arg)
      # {RepoMinerWeb.Worker, arg}
      # RepoMiner RabbitMQ producer
      {RepoMinerWeb.Producer, name: AMQPSender}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RepoMinerWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RepoMinerWebWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
