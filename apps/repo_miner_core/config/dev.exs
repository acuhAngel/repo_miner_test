import Config

config :repo_miner_core, RepoMinerCore.Repo,
  database: "repo_miner_core_repo_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :repo_miner_core, ecto_repos: [RepoMinerCore.Repo]
