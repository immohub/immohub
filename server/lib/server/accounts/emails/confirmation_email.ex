defmodule Server.Accounts.Emails.ConfirmationEmail do
  # Imports
  import Bamboo.Email
  # Aliases
  alias Server.Accounts.User

  def perform(%User{} = user) do
    new_email()
    |> to(user.email)
    |> subject("Email Confirmation")
    |> text_body("test")
  end
end
