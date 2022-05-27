defmodule RepoMinerCore.CodeRepoService.Branches do
  @moduledoc """
  This module is the Schema of the Table Branches.
  Has the reltions to oter tables and the valdidations for the fields.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "branches" do
    field(:name, :string)
    field(:commits_count, :integer)
    belongs_to(:repository, RepoMinerCore.CodeRepoService.Repository)
    timestamps()
  end

  @doc false

  def changeset(branch, attrs \\ %{}) do
    branch
    |> cast(attrs, [:branch, :commits_count, :repository_id])
    |> validate_required([:branch, :repository_id])
  end
end
