defmodule RepoMinerCore.Repo.Migrations.CreateUserCommits do
  use Ecto.Migration

  def change do
    create table(:user_commits) do
      add :username, :string
      add :commits_count, :int 
      add :repository_id, references("repositories")
      timestamps()
    end
  end
end
