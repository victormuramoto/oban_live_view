import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :oban_live_view, ObanLiveView.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "oban_live_view_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :oban_live_view, ObanLiveViewWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "O+tVKrtNebc0Md07+yszCUKz66NVZUXaRICXDVYVoeFGxfvbqY8ocQ24GIZ8sxVY",
  server: false

# In test we don't send emails.
config :oban_live_view, ObanLiveView.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
