defmodule ServerWeb.AuthController do
  use ServerWeb, :controller
  alias Server.Accounts.User

  def create(conn, %{"email" => email, "password" => password}) do
    case User.sign_in(email, password) do
      {:ok, auth_token} ->
        conn
          |> put_status(:ok)
          |> render("show.json", auth_token)
      {:error, reason} ->
        conn
          |> send_resp(401, reason)
    end
  end

  def delete(conn, _) do
    case User.sign_out(conn) do
      {:ok, _} ->
        conn
          |> send_resp(204, "")
      {:error, reason} ->
        conn
          |> send_resp(400, reason)
    end
  end
end
