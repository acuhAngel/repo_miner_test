defmodule RepoMinerAnalysis.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  defp poolboy_config do
    [
      name: {:local, :worker},
      worker_module: RepoMinerAnalysis.Worker,
      size: Application.fetch_env!(:repo_miner_analysis, :pool_size),
      max_overflow: 2
    ]
  end

  @impl true
  def start(_type, _args) do
    children = [
      :poolboy.child_spec(:worker, poolboy_config())
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RepoMinerAnalysis.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
