defmodule RepoMinerCore.Repo.Migrations.CreateStatusTable do
  use Ecto.Migration

  def change do
    create table(:status) do
        add :state, :string
        timestamps()
    end
  end
end
