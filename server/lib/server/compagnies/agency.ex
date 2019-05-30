defmodule Server.Compagnies.Agency do
  use Ecto.Schema
  import Ecto.Changeset

  schema "agencies" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(agency, attrs) do
    agency
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
