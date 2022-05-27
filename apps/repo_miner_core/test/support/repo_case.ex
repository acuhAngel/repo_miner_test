defmodule RepoMinerCore.RepoCase do
  @moduledoc """
  The case template above brings Ecto and Ecto.Query functions into your tests and checks-out a database connection. 
  It also enables a shared sandbox connection mode in case the test is not running asynchronously
  """
  use ExUnit.Case

  using do
    quote do
      alias RepoMinerCore.Repo
      import Ecto
      import Ecto.Query
      import RepoMinerCore.RepoCase
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(RepoMinerCore.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(RepoMinerCore.Repo, {:shared, self()})
    end

    :ok
  end
end
