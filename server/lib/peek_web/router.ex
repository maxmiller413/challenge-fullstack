defmodule PeekWeb.Router do
  use PeekWeb, :router

  pipeline :api do
    # Defining Cors origin
    plug CORSPlug, origin: "http://localhost:4200"
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    # Api
    forward "/api", Absinthe.Plug, schema: PeekWeb.Schema.Schema

    # Graphiql
    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: PeekWeb.Schema.Schema,
      interface: :simple
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: PeekWeb.Telemetry
    end
  end
end
