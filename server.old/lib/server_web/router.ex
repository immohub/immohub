defmodule ServerWeb.Router do
  use ServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticate do
    plug ServerWeb.Plugs.Authenticate
  end

  scope "/api", ServerWeb do
    pipe_through :api

    resources "/users", UserController
    # resources "/agencies", AgencyController, only: [:create]
  end

  scope "/auth", ServerWeb do
    pipe_through :api

    post "/sign_in", AuthController, :create
    delete "/sign_out", AuthController, :delete
  end
end
