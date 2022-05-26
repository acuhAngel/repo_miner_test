defmodule RepoMinerCore.Application do
  @moduledoc """
  This module start a supervsion tree to ecto.
  """
  use Application
  @impl true
  def start(_type, _args) do
    children = [
      RepoMinerCore.Repo
    ]

    opts = [strategy: :one_for_one, name: RepoMinerCore.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
