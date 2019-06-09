defmodule ServerWeb.AuthController do
  use ServerWeb, :controller
  # Aliases
  alias Server.Accounts.Auth
  alias ServerWeb.Helpers.HeadersHelper

  def create(conn, %{"user" => %{"email" => email, "password" => password}}) do
    case Auth.sign_in(email, password) do
      {:ok, params} ->
        conn
        |> put_status(:ok)
        |> render("show.json", params)
      {:error, reason} ->
        conn
        |> send_resp(401, reason)
    end
  end

  def delete(conn, _) do
    with  {:ok, auth_token} <- HeadersHelper.get_auth_token(conn),
          {:ok, _} <- Auth.sign_out(auth_token) do
      conn
      |> send_resp(204, "")
    else
      {:error, reason} ->
        conn
        |> send_resp(400, reason)
    end
  end
end
