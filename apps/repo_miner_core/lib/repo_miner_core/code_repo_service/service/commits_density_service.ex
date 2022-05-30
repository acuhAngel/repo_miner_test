defmodule RepoMinerCore.CodeRepoService.CommitsDensityService do
  @moduledoc """
  This module is the Schema of the Repository services.
  """
  import Ecto.Query, warn: false
  alias RepoMinerCore.Repo
  alias RepoMinerCore.CodeRepoService.CommitsDensity

  def get_commits_density!(id) do
    Repo.all(from(c in CommitsDensity, where: c.repository_id == ^id))
  end

   @doc """
  Returns the list of commits_densities.

  ## Examples

      iex> list_commits_densities()
      [%Commits_Density{}, ...]

  """
  def list_commits_densities do
    Repo.all(CommitsDensity)
  end

  @doc """
  Creates a commits__density.

  ## Examples

      iex> create_commits__density(%{field: value})
      {:ok, %Commits_Density{}}

      iex> create_commits__density(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_commits__density(attrs \\ %{}) do
    %CommitsDensity{}
    |> CommitsDensity.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a commits__density.

  ## Examples

      iex> update_commits__density(commits__density, %{field: new_value})
      {:ok, %Commits_Density{}}

      iex> update_commits__density(commits__density, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_commits__density(%CommitsDensity{} = commits__density, attrs) do
    commits__density
    |> CommitsDensity.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a commits__density.

  ## Examples

      iex> delete_commits__density(commits__density)
      {:ok, %Commits_Density{}}

      iex> delete_commits__density(commits__density)
      {:error, %Ecto.Changeset{}}

  """
  def delete_commits__density(%CommitsDensity{} = commits__density) do
    Repo.delete(commits__density)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking commits__density changes.

  ## Examples

      iex> change_commits__density(commits__density)
      %Ecto.Changeset{data: %Commits_Density{}}

  """
  def change_commits__density(%CommitsDensity{} = commits__density, attrs \\ %{}) do
    CommitsDensity.changeset(commits__density, attrs)
  end

end
