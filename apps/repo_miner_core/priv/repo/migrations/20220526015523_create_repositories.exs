defmodule RepoMinerCore.Repo.Migrations.CreateRepositories do
  use Ecto.Migration

  def change do
    create table(:repositories) do
      add :username,           :string
      add :provider,           :string
      add :repository_name,    :string
      add :url,                :string
      timestamps()
    end
  end
end
