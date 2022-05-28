defmodule RepoMinerCore.CodeRepoService.UserCommits do
  @moduledoc """
  This module is the Schema of the Table UserCommits.
  Has the reltions to oter tables and the valdidations for the fields.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_commits" do
    field(:username, :string)
    field(:commits_count, :integer)
    belongs_to(:repository, RepoMinerCore.CodeRepoService.Repository)
    timestamps()
  end

  def changeset(user_commit, attrs \\ %{}) do
    user_commit
    |> cast(attrs, [:username, :commits_count, :repository_id])
    |> validate_required([:username, :commits_count, :repository_id])
  end
end
