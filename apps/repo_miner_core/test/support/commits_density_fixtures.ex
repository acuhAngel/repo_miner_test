defmodule RepoMinerCore.CommitsDensityServiceFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RepoMinerCore.CommitsDensity` context.
  """
  @doc """
  Generate a Commits_density.
  """
  def commits_density_fixture(attrs \\ %{}) do
    repository = repository_fixture()

    {:ok, commits_density} =
      attrs
      |> Enum.into(%{
        commits_count: 42,
        year: 42,
        month: 42,
        repository_id: repository.id
      })
      |> RepoMinerCore.CodeRepoService.CommitsDensityService.create_commits__density()

    commits_density
  end

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
