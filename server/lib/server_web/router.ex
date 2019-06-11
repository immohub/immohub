defmodule ServerWeb.Router do
  use ServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticate do
    plug ServerWeb.Plugs.Authenticate
  end

  scope "/api", ServerWeb, as: :api do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      resources "/users", UserController
    end
    # resources "/agencies", AgencyController, only: [:create]
  end

  scope "/auth", ServerWeb, as: :auth do
    pipe_through :api

    post "/sign_in", AuthController, :create
    delete "/sign_out", AuthController, :delete
  end
end
