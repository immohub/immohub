defmodule ClientApiWeb.Router do
  use ClientApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ClientApiWeb do
    pipe_through :api
  end
end
