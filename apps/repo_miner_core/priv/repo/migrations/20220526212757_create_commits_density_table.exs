defmodule RepoMinerCore.Repo.Migrations.CreateCommitsDensityTable do
  use Ecto.Migration

  def change do
    create table(:commits_density) do
      add :year, :int
      add :month, :int
      add :repository_id, references("repositories")
      timestamps()
  end
  end
end
