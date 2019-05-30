defmodule Server.Repo.Migrations.CreateAgencies do
  use Ecto.Migration

  def change do
    create table(:agencies) do
      add :name, :string

      timestamps()
    end

  end
end
