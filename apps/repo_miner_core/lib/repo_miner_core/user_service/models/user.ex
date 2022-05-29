defmodule RepoMinerCore.UserService.User do
  @moduledoc """
  This module is the Schema of the Table Users.
  Has the reltions to oter tables and the valdidations for the fields.
  """
  # alias RepoMinerCore.CodeRepoService.Repository
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:name, :string)
    field(:handle, :string)
    field(:email, :string)
    field(:role, Ecto.Enum, values: [:admin, :collaborator])
    has_many(:repositories, RepoMinerCore.CodeRepoService.Repository)
    timestamps()
  end

  @doc false

  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [:handle, :email, :role, :name, :role])
    |> validate_required([:handle, :email, :role])
  end
end
