defmodule RepoMinerCore.CodeRepoService.BranchesService do
  @moduledoc """
  This module is the Schema of the Repository services.
  """
  import Ecto.Query, warn: false
  alias RepoMinerCore.Repo
  alias RepoMinerCore.CodeRepoService.Branches

  @spec get_branches!(any) :: any
  def get_branches!(id) do
    Repo.all(from(b in Branches, where: b.repository_id == ^id))
  end

  @doc """
  Returns the list of branches.

  ## Examples

      iex> list_branches()
      [%Branch{}, ...]

  """
  def list_branches do
    Repo.all(Branches)
  end

  @doc """
  Creates a branch.

  ## Examples

      iex> create_branch(%{field: value})
      {:ok, %Branch{}}

      iex> create_branch(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_branch(attrs \\ %{}) do
    %Branches{}
    |> Branches.changeset(attrs)
    |> Repo.insert()
  end

   @doc """
  Updates a branch.

  ## Examples

      iex> update_branch(branch, %{field: new_value})
      {:ok, %Branch{}}

      iex> update_branch(branch, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_branch(%Branches{} = branch, attrs) do
    branch
    |> Branches.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a branch.

  ## Examples

      iex> delete_branch(branch)
      {:ok, %Branch{}}

      iex> delete_branch(branch)
      {:error, %Ecto.Changeset{}}

  """
  def delete_branch(%Branches{} = branch) do
    Repo.delete(branch)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking branch changes.

  ## Examples

      iex> change_branch(branch)
      %Ecto.Changeset{data: %Branch{}}

  """
  def change_branch(%Branches{} = branch, attrs \\ %{}) do
    Branches.changeset(branch, attrs)
  end



end
