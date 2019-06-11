defmodule Server.Repo.Migrations.CreateLeadAgencies do
  use Ecto.Migration

  def change do
    create table(:lead_agencies) do
      add :title, :string
      add :slug, :string
      add :email, :string
      add :token, :string

      timestamps()
    end

    create unique_index(:lead_agencies, [:token])
  end
end
