defmodule RepoMinerCore.CodeRepoService.UserCommitsService do
  @moduledoc """
  This module is the Schema of the Repository services.
  """
  import Ecto.Query, warn: false
  alias RepoMinerCore.Repo
  alias RepoMinerCore.CodeRepoService.UserCommits

  def get_user_commits!(id) do
    Repo.all(from(u in UserCommits, where: u.repository_id == ^id))
  end

  @doc """
  Returns the list of user_commits.

  ## Examples

      iex> list_user_commits()
      [%UserCommits{}, ...]

  """
  def list_user_commits do
    Repo.all(UserCommits)
  end

  def create_users__commits(attrs \\ %{}) do
    %UserCommits{}
    |> UserCommits.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a users__commits.

  ## Examples

      iex> update_users__commits(users__commits, %{field: new_value})
      {:ok, %UserCommits{}}

      iex> update_users__commits(users__commits, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_users__commits(%UserCommits{} = users__commits, attrs) do
    users__commits
    |> UserCommits.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a users__commits.

  ## Examples

      iex> delete_users__commits(users__commits)
      {:ok, %UserCommits{}}

      iex> delete_users__commits(users__commits)
      {:error, %Ecto.Changeset{}}

  """
  def delete_users__commits(%UserCommits{} = users__commits) do
    Repo.delete(users__commits)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking users__commits changes.

  ## Examples

      iex> change_users__commits(users__commits)
      %Ecto.Changeset{data: %UserCommits{}}

  """
  def change_users__commits(%UserCommits{} = users__commits, attrs \\ %{}) do
    UserCommits.changeset(users__commits, attrs)
  end
end
