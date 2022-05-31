defmodule RepoMinerCore.RepositoryServiceTest do
  use RepoMinerCore.DataCase

  alias RepoMinerCore.CodeRepoService.RepositoryService

  describe "repository" do
    alias RepoMinerCore.CodeRepoService.Repository

    import RepoMinerCore.RepositoryServiceFixtures

    @invalid_attrs %{username: nil, provider: nil, repository_name: nil, url: nil, user_id: nil}

    test "list_repository/0 returns all users" do
      repository = repository_fixture()

      assert RepositoryService.list_repository() ==
               [repository] |> Repo.preload(:user) |> Repo.preload(:status)
    end

    test "get_repository!/1 returns the repository with given id" do
      repository = repository_fixture()
      assert RepositoryService.get_repository!(repository.id) == repository
    end

    test "create_repository/1 with valid data creates a repository" do
      user = user_fixture()

      valid_attrs = %{
        username: "some username",
        provider: :github,
        repository_name: "some name",
        url: "some url",
        user_id: user.id,
        main_commits_count: 42
      }

      assert {:ok, %Repository{} = repository} = RepositoryService.create_repository(valid_attrs)
      assert repository.username == "some username"
      assert repository.provider == :github
      assert repository.repository_name == "some name"
      assert repository.url == "some url"
      assert repository.user_id == user.id
      assert repository.main_commits_count == 42
    end

    test "create_repository/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = RepositoryService.create_repository(@invalid_attrs)
    end

    test "change_repository/1 returns a repository changeset" do
      repository = repository_fixture()
      assert %Ecto.Changeset{} = RepositoryService.change_repository(repository)
    end

    test "delte_repositorie" do
      repository = repository_fixture()
      assert {:ok, %Repository{}} = RepositoryService.delete_repository(repository.id)
      assert_raise Ecto.NoResultsError, fn -> RepositoryService.get_repository!(repository.id) end
    end
  end
end
