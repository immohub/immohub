defmodule Server.Accounts.Encryption do
  import Argon2, only: [add_hash: 1, check_pass: 2]

  def password_hashing(password), do: add_hash(password)
  def validate_password(user, password), do: check_pass(user, password)
end
