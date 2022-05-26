# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

config :repo_miner_core, RepoMinerCore.Repo,
  database: "repo_miner_core_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :repo_miner_core, ecto_repos: [RepoMinerCore.Repo]

import_config "../apps/repo_miner_web/config/config.exs"

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#
