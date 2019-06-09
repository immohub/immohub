defmodule ServerWeb.AuthView do
  use ServerWeb, :view
  # Aliases
  alias ServerWeb.{AuthView, UserView}

  def render("show.json", %{user: user, token: token}) do
    %{user: Map.merge(render_one(user, UserView, "user.json"), render_one(token, AuthView, "token.json"))}
  end

  def render("token.json", %{auth: token}) do
    %{token: token.token}
  end

end
