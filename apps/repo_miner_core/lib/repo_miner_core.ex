defmodule RepoMinerCore do
  @moduledoc """
  Documentation for `RepoMinerCore`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> RepoMinerCore.hello()
      :world

  """
  def hello do
    :world
  end

  def start(_type, _args) do
    children = [
      RepoMinerCore.Repo
    ]

    opts = [strategy: :one_for_one, name: RepoMinerCore.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
