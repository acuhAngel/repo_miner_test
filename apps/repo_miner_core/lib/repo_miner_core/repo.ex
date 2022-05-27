defmodule RepoMinerCore.Repo do
  use Ecto.Repo,
    otp_app: :repo_miner_core,
    adapter: Ecto.Adapters.Postgres
end
