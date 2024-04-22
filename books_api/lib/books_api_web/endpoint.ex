defmodule BooksApiWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :books_api

  # Session configuration
  @session_options [
    store: :cookie,
    key: "_books_api_key",
    signing_salt: "0PGDPhJV",
    same_site: "Lax"
  ]

  # Socket configuration for LiveView
  socket "/live", Phoenix.LiveView.Socket,
    websocket: [connect_info: [session: @session_options]],
    longpoll: [connect_info: [session: @session_options]]

  # Serve static files from the "priv/static" directory
  plug Plug.Static,
    at: "/",
    from: :books_api,
    gzip: false,
    only: BooksApiWeb.static_paths()

  # Code reloading and Ecto repo status check
  if code_reloading? do
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :books_api
  end

  # LiveDashboard request logger configuration
  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  # Common plugs for request processing
  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]
  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()
  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options

  # Mount the router
  plug BooksApiWeb.Router
end
