defmodule Server.Auth.Token do
  use Ecto.Schema
  import Ecto.Changeset

  schema "auth_tokens" do
    field :revoked_at, :utc_datetime
    field :token, :string
    field :user_id, :id

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
