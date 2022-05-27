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

config :repo_miner_analysis, :pool_size, 10

config :amqp,
  connections: [
    conn: [url: "amqp://guest:guest@localhost"]
  ],
  channels: [
    chan: [connection: :conn]
  ]

import_config "../apps/repo_miner_web/config/config.exs"

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#
