defmodule RepoMinerCore.Repo.Migrations.CreateStatusesTable do
  use Ecto.Migration

  def change do
    create table(:statuses) do
        add :status, :string
        timestamps()
    end
  end
end
