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
    field(:provider, :string)
    field(:repository_name, :string)
    field(:url, :string)
    # has_many :branches, , foreign_key: :repository_id
    # has_one :status, , foreign_key: :repository_id
    # has_one :handle 
    timestamps()
  end

  @doc false

  def changeset(repository, attrs \\ %{}) do
    repository
    |> cast(attrs, [:username, :provider, :repository_name, :url])
    |> validate_required([:username, :provider, :repository_name, :url])
  end
end
