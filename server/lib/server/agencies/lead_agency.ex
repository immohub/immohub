defmodule Server.Agencies.LeadAgency do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lead_agencies" do
    field :email, :string
    field :slug, :string
    field :title, :string
    field :token, :string

    timestamps()
  end

  @doc false
  def changeset(lead_agency, attrs) do
    lead_agency
    |> cast(attrs, [:title, :slug, :email, :token])
    |> validate_required([:title, :slug, :email, :token])
    |> validate_format(:email, ~r/@/) # Check that email is valid
    |> validate_email_unique(:email) # Validate that email is unique throw the users
    |> unique_constraint(:token)
  end

  # defp validate_email_unique(%Ecto.Changeset{valid?: true, changes: %{email: email}} = changeset, field) do
  #   email = get_field(changeset, field)
  #   case Repo.exists?(from u in User, where u.email == email) do
  #     true -> add_error(changeset, field, "Email already associated with a User")
  #     _ -> changeset
  #   end
  # end
  defp validate_email_unique(changeset, field), do: changeset
end
