use Mix.Config

config :database, Database.Repo,
  username: System.get_env("PGUSER"),
  password: System.get_env("PGPASSWORD"),
  database: System.get_env("PGDATABASE"),
  hostname: System.get_env("PGHOST"),
  pool_size: 10 # in dev.exs et prod.secret.exs
