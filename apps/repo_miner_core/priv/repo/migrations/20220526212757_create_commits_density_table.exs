defmodule RepoMinerCore.Repo.Migrations.CreateCommitsDensityTable do
  use Ecto.Migration

  def change do
    create table(:commits_density) do
      add :year, :int
      add :january, :int
      add :february, :int
      add :march, :int
      add :april, :int
      add :may, :int
      add :june, :int
      add :july, :int
      add :august, :int
      add :september, :int
      add :october, :int
      add :november, :int
      add :december, :int
      add :repository_id, references("repositories")
      timestamps()
  end
  end
end
