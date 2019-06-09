defmodule ServerWeb.Plugs.Authenticate do
  # Import
  import Plug.Conn
  # Aliases
  alias Server.Accounts.Users
  alias ServerWeb.Helpers.HeadersHelper

  def init(default), do: default

  def call(conn, _default) do
    with  {:ok, token} <- HeadersHelper.get_auth_token(conn),
          {:ok, user} <- Users.get_token_user(token) do
      authorized(conn, user)
    else
      _ -> unauthorized(conn)
    end
  end

  defp authorized(conn, user) do
    conn
      |> assign(:signed_in, true)
      |> assign(:signed_user, user)
  end

  defp unauthorized(conn) do
    conn
      |> send_resp(401, "Unauthorized")
      |> halt()
  end
end
