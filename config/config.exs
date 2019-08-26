# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :contact_management_system,
  ecto_repos: [ContactManagementSystem.Repo]

# Configures the endpoint
config :contact_management_system, ContactManagementSystemWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "R1fFfLnm5DfqtHqgBD0R3ujNVmhp1EDEUfCZZ3UEBCJNrfg7c2ofF8OBzHU9gmrL",
  render_errors: [view: ContactManagementSystemWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ContactManagementSystem.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
