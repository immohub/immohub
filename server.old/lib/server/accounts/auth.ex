defmodule Server.Accounts.Auth do
  # Aliases
  alias Server.Repo
  alias Server.Accounts.User
  alias Server.Accounts.Token
  alias Server.Accounts.Encryption
  alias Server.Services.Authenticator

  def sign_in(email, password) do
    case Repo.get_by(User, email: String.downcase(email)) |> Encryption.validate_password(password) do
      {:ok, user} ->
        sign_in(user)
      _ -> {:error, "Could not login"}
    end
  end

  def sign_in(%User{} = user) do
    generated_token = Authenticator.generate_token(user)
    with {:ok, token} <- Repo.insert(Ecto.build_assoc(user, :auth_tokens, %{token: generated_token})) do
      {:ok, %{user: user, token: token}}
    else
      {:error, reason} -> {:error, reason}
    end
  end

  def sign_out(%Token{} = token) do
    Repo.delete(token)
  end

  def sign_out(token) when is_binary(token) do
    case Repo.get_by(Token, %{token: token}) do
      nil -> {:error, :not_found}
      token -> sign_out(token)
    end
  end

  # defp check_password(%User{} = user, password), do: Encryption.validate_password(user, password)
  # defp check_password(nil, _), do: false
end
