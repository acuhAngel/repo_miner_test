defmodule RepoMinerCore.CodeRepoService.Branches do
  @moduledoc """
  This module is the Schema of the Table Branches.
  Has the reltions to oter tables and the valdidations for the fields.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "branches" do
    field(:name, :string)
    # has many commits
    timestamps()
  end

  @doc false

  def changeset(branch, attrs \\ %{}) do
    branch
    |> cast(attrs, [:state])
    |> validate_required([:state])
  end
end
