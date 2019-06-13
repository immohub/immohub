defmodule Server.Agencies.Agency do
  use Ecto.Schema
  import Ecto.Changeset
  # Aliases
  alias Server.Accounts.User

  schema "agencies" do
    field :name, :string
    field :slug, :string
    # Associations:
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(agency, attrs) do
    agency
    |> cast(attrs, [:name, :slug])
    |> validate_required([:name, :slug])
    |> unique_constraint(:slug)
  end
end
