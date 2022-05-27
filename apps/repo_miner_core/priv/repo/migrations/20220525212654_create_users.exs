defmodule RepoMinerCore.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :handle,  :string
      add :email,   :string
      add :role,    :string
      timestamps()
    end
  end

end
