defmodule RepoMinerCore.CodeRepoService.StatusService do
  @moduledoc """
  This module is the Schema of the Repository services.
  """
  import Ecto.Query, warn: false
  alias RepoMinerCore.Repo
  alias RepoMinerCore.CodeRepoService.Status

  def get_status!(repo_id) do
    status = Repo.get_by(Status, repository_id: repo_id)
    status.state
  end

  def get_status!(repo_id) do
    status = Repo.get_by(Status, repository_id: repo_id)
    status.state
  end

  @doc """
  Returns the list of status.

  ## Examples

      iex> list_status()
      [%Commits_Density{}, ...]

  """
  def list_status do
    Repo.all(Status)
  end

  @doc """
  Creates a status.

  ## Examples

      iex> create_status(%{field: value})
      {:ok, %Commits_Density{}}

      iex> create_status(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_status(attrs \\ %{}) do
    %Status{}
    |> Status.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a status.

  ## Examples

      iex> update_status(status, %{field: new_value})
      {:ok, %Commits_Density{}}

      iex> update_status(status, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_status(%Status{} = status, attrs) do
    status
    |> Status.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a status.

  ## Examples

      iex> delete_status(status)
      {:ok, %Commits_Density{}}

      iex> delete_status(status)
      {:error, %Ecto.Changeset{}}

  """
  def delete_status(%Status{} = status) do
    Repo.delete(status)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking status changes.

  ## Examples

      iex> change_status(status)
      %Ecto.Changeset{data: %Commits_Density{}}

  """
  def change_status(%Status{} = status, attrs \\ %{}) do
    Status.changeset(status, attrs)
  end
end
