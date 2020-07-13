import Config

secret_key_base =
  System.get_env(
    "SECRET_KEY_BASE" ||
      raise("""
      SECRET_KEY_BASE is not found in the environment variables.
      You can generate one by calling: mix phx.gen.secret
      """)
  )

app_port =
  System.get_env(
    "APP_PORT" ||
      raise("""
      APP_PORT is not found in the environment variables.
      """)
  )

app_host_name =
  System.get_env(
    "APP_HOSTNAME" ||
      raise("""
      APP_HOSTNAME is missing from the environment variables.
      """)
  )

config :api,
       ApiWeb.Endpoint,
       url: [
         host: app_host_name,
         port: app_port
       ],
       https: [
         port: 433,
         cipher_suite: :strong,
         keyfile: "/certs/mathgame.key",
         certfile: "/certs/mathgame.crt",
         transport_options: [
           socket_opts: [:inet6]
         ]
       ],
       secret_key_base: secret_key_base

db_user =
  System.get_env(
    "DB_USER" ||
      raise("""
      DB_USER is missing from the environment variables.
      """)
  )

db_pass =
  System.get_env(
    "DB_PASS" ||
      raise("""
      DB_PASS is missing from the environment variables.
      """)
  )

db_host =
  System.get_env(
    "DB_HOST" ||
      raise("""
      DB_HOST is missing from the environment variables.
      """)
  )

db_port = System.get_env("DB_PORT" || 5432)
db_name = System.get_env("DB_NAME" || "math_game")
db_pool_size = System.get_env("DB_POOL_SIZE" || 10)

config :api,
       Api.Repo,
       username: db_user,
       password: db_pass,
       database: db_name,
       hostname: db_host,
       port: db_port,
       pool_size: db_pool_size
