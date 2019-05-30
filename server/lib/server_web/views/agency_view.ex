defmodule ServerWeb.AgencyView do
  use ServerWeb, :view
  alias ServerWeb.AgencyView

  def render("index.json", %{agencies: agencies}) do
    %{data: render_many(agencies, AgencyView, "agency.json")}
  end

  def render("show.json", %{agency: agency}) do
    %{data: render_one(agency, AgencyView, "agency.json")}
  end

  def render("agency.json", %{agency: agency}) do
    %{id: agency.id,
      name: agency.name}
  end
end
