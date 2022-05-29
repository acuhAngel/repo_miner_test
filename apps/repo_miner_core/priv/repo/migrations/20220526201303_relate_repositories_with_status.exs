defmodule RepoMinerCore.Repo.Migrations.RelateRepositoriesWithStatus do
  use Ecto.Migration

  def change do
    alter table("statuses") do
      add :repository_id, references("repositories")
    end
  end
end
