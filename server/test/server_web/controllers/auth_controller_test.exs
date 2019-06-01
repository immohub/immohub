defmodule ServerWeb.AuthControllerTest do
  use ServerWeb.ConnCase, async: true

  test "redirect user to Auth0 go Authentification", %{conn: conn} do
    conn = get conn, "/auth/auth0"
    assert redirected_to(conn, 302)
  end
end 
