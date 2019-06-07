defmodule Server.Repo.Migrations.CreateAgencies do
  use Ecto.Migration

  def change do
    create table(:agencies) do
      add :name, :string
      add :slug, :string
      add :user_id, references(:users, on_delete: :nilify_all)

      timestamps()
    end

    create unique_index(:agencies, [:slug])
    create index(:agencies, [:user_id])
  end
end
