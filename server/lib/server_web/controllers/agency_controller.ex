defmodule ServerWeb.AgencyController do
  use ServerWeb, :controller

  alias Server.Compagnies
  alias Server.Compagnies.Agency

  action_fallback ServerWeb.FallbackController

  def index(conn, _params) do
    agencies = Compagnies.list_agencies()
    render(conn, "index.json", agencies: agencies)
  end

  def create(conn, %{"agency" => agency_params}) do
    with {:ok, %Agency{} = agency} <- Compagnies.create_agency(agency_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.agency_path(conn, :show, agency))
      |> render("show.json", agency: agency)
    end
  end

  def show(conn, %{"id" => id}) do
    agency = Compagnies.get_agency!(id)
    render(conn, "show.json", agency: agency)
  end

  def update(conn, %{"id" => id, "agency" => agency_params}) do
    agency = Compagnies.get_agency!(id)

    with {:ok, %Agency{} = agency} <- Compagnies.update_agency(agency, agency_params) do
      render(conn, "show.json", agency: agency)
    end
  end

  def delete(conn, %{"id" => id}) do
    agency = Compagnies.get_agency!(id)

    with {:ok, %Agency{}} <- Compagnies.delete_agency(agency) do
      send_resp(conn, :no_content, "")
    end
  end
end
