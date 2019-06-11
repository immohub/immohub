defmodule Server.Services.Authenticator do
  @seed "test"
  @secret "CH8mMkTxvFvAE_k7AgAE_eBVA0OR1vNGkPbTiZ5m"

  def generate_token(id) do
    Phoenix.Token.sign(@secret, @seed, id)
  end

  def verify_token(token) do
    case Phoenix.Token.verify(@secret, @seed, token, max_age: 86400) do
      {:ok, _} -> {:ok, token}
      error -> error
    end
  end

end
