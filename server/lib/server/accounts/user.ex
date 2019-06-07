defmodule Server.Accounts.User do
  use Ecto.Schema
  # Import
  import Ecto.Changeset
  import Argon2, only: [hash_pwd_salt: 1, check_pass: 2]
  # Alias
  # alias Server.Accounts.User
  alias Server.Repo
  alias Server.Services.Authenticator

  schema "users" do
    field :email, :string
    field :password_hash, :string
    # Virtual fields:
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    # Associations:
    has_many :auth_tokens, Server.Auth.Token

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

  def sign_in(email, password) do
    case check_pass(Repo.get_by(User, email: email), password) do
      {:ok, user} ->
        token = Authenticator.generate_token(user)
        Repo.insert(Ecto.build_assoc(user, :auth_tokens, %{token: token}))
      error -> error
    end
  end

  def sign_out(conn) do
    case Authenticator.get_auth_token(conn) do
      {:ok, token} ->
        case Repo.get_by(Server.Auth.Token, %{token: token}) do
          nil -> {:error, :not_found}
          auth_token -> Repo.delete(auth_token)
        end
      error -> error
    end
  end

  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: pass}} = changeset) do
    put_change(changeset, :password_hash, hash_pwd_salt(pass))
  end

  defp put_password_hash(changeset), do: changeset
end
