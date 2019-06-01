defmodule ServerWeb.AuthController do
  use ServerWeb, :controller

  plug Ueberauth

  def delete(conn, _params) do
    conn
      |> configure_session(drop: true)
  end
end
