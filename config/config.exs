# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :live_view_counter, LiveViewCounterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "oq1rRRs+4fqLuaBxIDEbrV4ALaCpglx6aEZZGKi1JiPuQt1dKKvMww2ghfxGWFFW",
  render_errors: [view: LiveViewCounterWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LiveViewCounter.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :live_view_counter, LiveViewCounterWeb.Endpoint,
  live_view: [signing_salt: "7HekGYwxATz33gM/rH9q2mV+uKJq5/Hu"]

config :phoenix,
  template_engines: [leex: Phoenix.LiveView.Engine]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
