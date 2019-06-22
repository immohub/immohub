defmodule Database.Accounts.AuthToken do
  use Ecto.Schema
  # Imports
  import Ecto.Changeset
  # Aliases
  alias Database.Accounts.User

  schema "auth_tokens" do
    field :revoked_at, :utc_datetime
    field :token, :string
    # Virtual fields:
    field :revoked, :boolean, virtual: true
    # Associations:
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(token, attrs) do
    token
    |> cast(attrs, [:token, :revoked_at])
    |> validate_required([:token, :revoked_at])
    |> unique_constraint(:token)
  end
end
