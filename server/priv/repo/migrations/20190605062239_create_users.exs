defmodule Server.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :password_hash, :string, null: false
      add :confirmation_token, :string
      add :confirmed_at, :datetime, default: nil

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
