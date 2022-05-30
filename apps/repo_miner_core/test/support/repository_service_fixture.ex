defmodule RepoMinerCore.RepositoryServiceFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RepoMinerCore.RepositoryService` context.
  """

  @doc """
  Generate a repository.
  """
  def repository_fixture(attrs \\ %{}) do
    user = user_fixture()

    {:ok, repository} =
      attrs
      |> Enum.into(%{
        username: "some username",
        provider: :github,
        repository_name: "some repository name",
        url: "some url",
        user_id: user.id
      })
      |> RepoMinerCore.CodeRepoService.RepositoryService.create_repository()

    repository
  end

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        handle: "some handle",
        name: "some name",
        role: :admin
      })
      |> RepoMinerCore.UserService.create_user()

    user
  end
end
