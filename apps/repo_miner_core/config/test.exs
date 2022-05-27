import Config

config :repo_miner_core, RepoMinerCore.Repo,
  database: "repo_miner_core_repo_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
