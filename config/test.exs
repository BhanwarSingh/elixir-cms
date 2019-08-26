use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :contact_management_system, ContactManagementSystemWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :contact_management_system, ContactManagementSystem.Repo,
  username: "postgres",
  password: "postgres",
  database: "contact_management_system_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
