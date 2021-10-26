# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :peek,
  ecto_repos: [Peek.Repo]

# Configures the endpoint
config :peek, PeekWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bAV7+mrZDTxSZ7+V0pWsYoUCw51hkZIPlKEQDRZUJKfPC0E00XCfgd8OdchRWd9G",
  render_errors: [view: PeekWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Peek.PubSub,
  live_view: [signing_salt: "QFeiKMf0"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
