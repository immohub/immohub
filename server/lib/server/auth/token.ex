defmodule Server.Auth.Token do
  use Ecto.Schema
  import Ecto.Changeset

  schema "auth_tokens" do
    field :provider, :string
    field :token, :string
    belongs_to :user, Server.User

    timestamps()
  end

  @doc false
  def changeset(token, attrs) do
    token
    |> cast(attrs, [:provider, :token])
    |> validate_required([:provider, :token])
    |> unique_constraint(:provider, name: :index_auth_tokens_on_user_token_provider)
    |> unique_constraint(:token)
  end
end
