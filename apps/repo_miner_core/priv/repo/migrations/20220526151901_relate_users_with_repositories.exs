defmodule RepoMinerCore.Repo.Migrations.RelateUsersWithRepositories do
  use Ecto.Migration

  def change do
    alter table("repositories") do
      add :handle_id, references("users")
    end
  end
end
