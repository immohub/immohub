defmodule ServerWeb.AuthController do
  use ServerWeb, :controller

  plug Ueberauth

  # alias ServerWeb.Router.Helpers
  # alias Ueberauth.Strategy.Helpers

  def delete(conn, _params) do
    conn
      |> configure_session(drop: true)
  end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
      |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    IO.inspect auth
    conn
      |> redirect(to: "/")
    # case User.find_or_create(auth) do
    #   {:ok, user} ->
    #     conn
    #       |> put_session(:current_user, user)
    #   {:error, reason} ->
    #     conn
    #       |> redirect(to: "/")
    # end
  end
end
