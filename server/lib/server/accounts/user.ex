defmodule Server.Accounts.User do
  use Ecto.Schema
  # Imports
  import Ecto.Changeset
  # Alias
  alias Server.Accounts.Encryption

  schema "users" do
    field :email, :string
    field :password_hash, :string
    field :confirmation_token, :string
    field :confirmed_at, :utc_datetime
    # Virtual fields:
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    # Associations:
    has_many :auth_tokens, Server.Accounts.Token
    has_many :agencies, Server.Agencies.Agency

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :password_confirmation])
    |> validate_required([:email, :password, :password_confirmation])
    |> validate_format(:email, ~r/@/) # Check that email is valid
    |> validate_length(:password, min: 8) # Check that password length is >= 8 
    |> validate_confirmation(:password) # Check that password === password_confirmation
    |> unique_constraint(:email) # Check that email is unique
    |> put_password_hash()
  end

  @doc false
  def registration_changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :password_confirmation])
    |> validate_required([:email, :password, :password_confirmation])
    |> validate_format(:email, ~r/@/) # Check that email is valid
    |> validate_length(:password, min: 8) # Check that password length is >= 8 
    |> validate_confirmation(:password) # Check that password === password_confirmation
    |> unique_constraint(:email) # Check that email is unique
    |> put_password_hash()
    |> put_confirmation_token()
  end

  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    changeset
    |> change(Encryption.password_hashing(password))
  end
  defp put_password_hash(changeset), do: changeset

  defp put_confirmation_token(changeset) do
    changeset
    |> change(%{confirmation_token: SecureRandom.urlsafe_base64()})
  end
end
