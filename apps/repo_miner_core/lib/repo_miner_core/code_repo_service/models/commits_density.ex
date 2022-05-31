defmodule RepoMinerCore.CodeRepoService.CommitsDensity do
  @moduledoc """
  This module is the Schema of the Table CommitsDensity.
  Has the reltions to oter tables and the valdidations for the fields.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "commits_density" do
    field(:year, :integer)
    field(:month, :integer)
    field(:commits_count, :integer)
    belongs_to(:repository, RepoMinerCore.CodeRepoService.Repository)
    timestamps()
  end

  @doc false

  def changeset(commits_density, attrs \\ %{}) do
    commits_density
    |> cast(attrs, [:year, :month, :commits_count, :repository_id])
    |> validate_required([:repository_id, :year, :month])
  end
end
