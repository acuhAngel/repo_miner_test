defmodule RepoMinerCore.CodeRepoService.Commits do
   @moduledoc """
  This module is the Schema of the Table Commits.
  Has the reltions to oter tables and the valdidations for the fields.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "commits" do
    field(:hash, :string)
    field(:date, :date)
    # belongs to repositories
    timestamps()
  end

  @doc false

  def changeset(commit, attrs \\ %{}) do
    commit
    |> cast(attrs, [:hash, :date])
    |> validate_required([:hash, :date])
  end
end
