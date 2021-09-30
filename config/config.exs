# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Configures the endpoint
config :surface_fn_component_context_bug, SurfaceFnComponentContextBugWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mXM2x+tBOWBpS2BvzaAKA7hqJThmlBqran+ELvVvA2efsi4zYucFwv9PybCKPU2N",
  render_errors: [view: SurfaceFnComponentContextBugWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SurfaceFnComponentContextBug.PubSub,
  live_view: [signing_salt: "HxK2Z9EL"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.12.18",
  default: [
    args: ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
