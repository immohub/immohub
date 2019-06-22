defmodule Database.Accounts do
  # Aliases
  alias Database.Repo
  alias Encryption.Password
  alias Database.Accounts.{AuthToken, User}

  # Token
  def delete_auth_token(%AuthToken{} = auth_token) do
    Repo.delete(auth_token)
  end

  def get_auth_token_with_token(token) when is_binary(token) do
    with auth_token <- Repo.get_by!(AuthToken, token: token) do
      {:ok, auth_token}
    end
  end

  # User
  def get_user_with_credentials(email, password) do
    with  user <- Repo.get_by!(User, email: email |> String.downcase),
          {:ok, user} <- user |> Password.validate_password(password) do
      {:ok, user}
    end
  end

end
