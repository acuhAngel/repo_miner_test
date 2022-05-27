defmodule RepoMinerCore.UserService.User do
  @moduledoc """
  This module is the Schema of the Table Users.
  Has the reltions to oter tables and the valdidations for the fields.
  """
  # alias RepoMinerCore.CodeRepoService.Repository
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:handle, :string)
    field(:email, :string)
    field(:role, Ecto.Enum, values: [:admin, :collaborator])
    has_many(:repository, RepoMinerCore.CodeRepoService.Repository, foreign_key: :handle_id)
    timestamps()
  end

  @doc false

  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [:handle, :email, :role])
    |> validate_required([:handle, :email, :role])
  end
end
