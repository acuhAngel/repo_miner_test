import Config

config :repo_miner_core, RepoMinerCore.Repo,
  database: "repo_miner_core_test#{System.get_env("MIX_TEST_PARTITION")}",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
