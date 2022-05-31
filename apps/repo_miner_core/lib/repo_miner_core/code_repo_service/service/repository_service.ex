defmodule RepoMinerCore.CodeRepoService.RepositoryService do
  @moduledoc """
  This module is the Schema of the Repository services.
  """
  import Ecto.Query, warn: false
  alias RepoMinerCore.Repo
  alias RepoMinerCore.CodeRepoService.Repository

  def change_repository(%Repository{} = repository, attrs \\ %{}) do
    Repository.changeset(repository, attrs)
  end

  def list_repository do
    Repo.all(Repository) |> Repo.preload(:user) |> Repo.preload(:status)
  end

  def get_repository!(id) do
    Repo.get!(Repository, id)
  end

  def create_repository(attrs \\ %{}) do
    %Repository{}
    |> Repository.changeset(attrs)
    |> Repo.insert()
  end

  def delete_repository(repo_id) do
    repository = get_repository!(repo_id)
    Repo.delete(repository)
  end
end
