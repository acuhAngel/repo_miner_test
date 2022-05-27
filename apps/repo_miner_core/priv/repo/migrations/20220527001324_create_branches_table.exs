defmodule RepoMinerCore.Repo.Migrations.CreateBranchesTable do
  use Ecto.Migration

  def change do
    create table(:branches) do
      add :name, :string
      add :commits_count, :int 
      add :repository_id, references("repositories")
      timestamps()
    end
  end
end
