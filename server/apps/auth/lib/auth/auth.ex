defmodule Auth.Auth do
  # Aliases
  # alias Database.Repo
  alias Database.Accounts
  alias Database.Accounts.{User, AuthToken}
  alias Auth.Authenticator
  alias Encryption.Password
  
  def sign_in(email, password) do
    with {:ok, user} <- Accounts.get_user_with_credentials(email, password) |> Password.validate_password(password) do
      sign_in(user)
    end
  end

  def sign_in(%User{} = user) do
    with {:ok, token} <- Authenticator.generate_token(user) |> user.log_user_in do
      {:ok, %{user: user, token: token}}
    end
  end

  def sign_out(token) when is_binary(token) do
    with {:ok, auth_token} <- Accounts.get_auth_token_with_token(token) do
      sign_out(auth_token)
    end
  end

  def sign_out(%AuthToken{} = auth_token) do
    Accounts.delete_auth_token(auth_token)
  end
end
