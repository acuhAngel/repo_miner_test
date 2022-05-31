defmodule RepoMinerCore.Repo.Migrations.CreateRepositories do
  use Ecto.Migration

  def change do
    create table(:repositories) do
      add :username,           :string
      add :provider,           :string
      add :repository_name,    :string
      add :url,                :string
      add :main_commits_count, :integer
      add :token,              :string
      timestamps()
    end
  end
end
