defmodule ServerWeb.AuthView do
  use ServerWeb, :view

  def render("show.json", auth_token) do
    %{data: %{token: auth_token}}
  end

end
