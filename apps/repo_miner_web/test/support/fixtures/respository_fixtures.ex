defmodule RepoMinerWeb.RespositoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RepoMinerWeb.Respository` context.
  """

  @doc """
  Generate a repository.
  """
  def repository_fixture(attrs \\ %{}) do
    {:ok, repository} =
      attrs
      |> Enum.into(%{})

    # |> RepoMinerWeb.Respository.create_repository()

    repository
  end
end
