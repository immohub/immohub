defmodule Server.Agencies do
  @moduledoc """
  The Agencies context.
  """

  import Ecto.Query, warn: false
  # Import
  alias Ecto.Multi
  alias Server.Repo
  alias Server.Accounts.User
  alias Server.Agencies.Agency

  @doc """
  Creates a agency.

  ## Examples

      iex> create_agency(%{field: value})
      {:ok, %Agency{}}

      iex> create_agency(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_agency_with_user(user_params \\ %{}, agency_params \\ %{}) do
    multi_struct = Multi.new
      |> Multi.insert(:user, %User{} |> User.changeset(user_params))
      |> Multi.run(:agency, fn repo, %{user: user} ->
          user
            |> Ecto.build_assoc(:agencies)
            |> Agency.changeset(agency_params)
            |> repo.insert
        end)
      |> Multi.run(:auth_token, fn repo, %{user: user} ->
          User.sign_in(user)
        end)
    Repo.transaction(multi_struct)
  end

end
