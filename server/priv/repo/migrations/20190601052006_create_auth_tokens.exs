defmodule Server.Repo.Migrations.CreateAuthTokens do
  use Ecto.Migration

  def change do
    create table(:auth_tokens) do
      add :provider, :string
      add :token, :string
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:auth_tokens, [:token])
    create unique_index(:auth_tokens, [:user_id, :provider], name: :index_auth_tokens_on_user_token_provider)
    create index(:auth_tokens, [:user_id])
  end
end
