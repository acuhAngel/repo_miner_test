import Config

import_config "../apps/repo_miner_core/config/test.exs"

config :amqp,
  connections: [
    conn: [
      url: "amqp://guest:guest@#{if System.get_env("CI"), do: "rabbitmq", else: "localhost"}"
    ]
  ],
  channels: [
    chan: [connection: :conn]
  ]
