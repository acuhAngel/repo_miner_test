defmodule RepoMinerCore.CodeRepoService do
  @moduledoc """
  The CodeRepoService context.
  """

  import Ecto.Query, warn: false
  alias RepoMinerCore.Repo

  alias RepoMinerCore.CodeRepoService.Statuses

  @doc """
  Returns the list of status.

  ## Examples

      iex> list_status()
      [%Statuses{}, ...]

  """
  def list_status do
    Repo.all(Statuses)
  end

  @doc """
  Gets a single statuses.

  Raises `Ecto.NoResultsError` if the Statuses does not exist.

  ## Examples

      iex> get_statuses!(123)
      %Statuses{}

      iex> get_statuses!(456)
      ** (Ecto.NoResultsError)

  """
  def get_statuses!(id), do: Repo.get!(Statuses, id)

  @doc """
  Creates a statuses.

  ## Examples

      iex> create_statuses(%{field: value})
      {:ok, %Statuses{}}

      iex> create_statuses(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_statuses(attrs \\ %{}) do
    %Statuses{}
    |> Statuses.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a statuses.

  ## Examples

      iex> update_statuses(statuses, %{field: new_value})
      {:ok, %Statuses{}}

      iex> update_statuses(statuses, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_statuses(%Statuses{} = statuses, attrs) do
    statuses
    |> Statuses.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a statuses.

  ## Examples

      iex> delete_statuses(statuses)
      {:ok, %Statuses{}}

      iex> delete_statuses(statuses)
      {:error, %Ecto.Changeset{}}

  """
  def delete_statuses(%Statuses{} = statuses) do
    Repo.delete(statuses)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking statuses changes.

  ## Examples

      iex> change_statuses(statuses)
      %Ecto.Changeset{data: %Statuses{}}

  """
  def change_statuses(%Statuses{} = statuses, attrs \\ %{}) do
    Statuses.changeset(statuses, attrs)
  end
end
