defmodule AuthWeb.Router do
  use AuthWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/auth", AuthWeb do
    pipe_through :api

    get "/test", AuthController, :test
    post "/login", AuthController, :create
    post "/logout", AuthController, :delete
  end
end
