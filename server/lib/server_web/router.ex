defmodule ServerWeb.Router do
  use ServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ServerWeb do
    pipe_through :api
    resources "/agencies", AgencyController, except: [:new, :edit]
  end
end
