defmodule Server.Accounts.Emails.ConfirmationEmail do
  import Bamboo.Email

  def perform(%User{} = user) do
    new_email()
    |> to(user.email)
    |> subject("Email Confirmation")
    |> 
  end
end
