defmodule RepoMinerCore.CodeRepoService.Repository do
  @moduledoc """
  This module is the Schema of the Table Repositories.
  Has the reltions to oter tables and the valdidations for the fields.
  """
  # alias RepoMinerCore.CodeRepoService.Repository
  use Ecto.Schema
  import Ecto.Changeset

  schema "repositories" do
    field(:username, :string)
    field(:provider, Ecto.Enum, values: [:github])
    field(:repository_name, :string)
    field(:url, :string)
    field(:main_commits_count, :integer)
    field(:token, :string)
    belongs_to(:user, RepoMinerCore.UserService.User)
    has_many(:branches, RepoMinerCore.CodeRepoService.Branches)
    has_one(:status, RepoMinerCore.CodeRepoService.Status)
    has_many(:commits_density, RepoMinerCore.CodeRepoService.CommitsDensity)
    has_many(:user_commits, RepoMinerCore.CodeRepoService.UserCommits)
    timestamps()
  end

  @doc false

  def changeset(repository, attrs \\ %{}) do
    repository
    |> cast(attrs, [:username, :provider, :repository_name, :url, :user_id, :main_commits_count])
    |> validate_required([:username, :provider, :repository_name, :url])
  end
end
