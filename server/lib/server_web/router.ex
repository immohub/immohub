defmodule ServerWeb.Router do
  use ServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ServerWeb do
    pipe_through :api
  end

  scope "/auth", ServerWeb do
    pipe_through :api

    get "/:provider", AuthController, :request
  end
end
