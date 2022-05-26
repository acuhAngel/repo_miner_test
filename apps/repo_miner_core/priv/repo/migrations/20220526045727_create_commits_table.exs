defmodule RepoMinerCore.Repo.Migrations.CreateCommitsTable do
  use Ecto.Migration

  def change do
    create table(:commits) do
      add :hash, :string
      add :date, :date
      timestamps()
    end
  end
end
