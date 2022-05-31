defmodule RepoMinerCore.CommitsDensityServiceTest do
  use RepoMinerCore.DataCase
  alias RepoMinerCore.CodeRepoService.CommitsDensityService

  describe "commits_densities" do
    alias RepoMinerCore.CodeRepoService.CommitsDensity

    import RepoMinerCore.CommitsDensityServiceFixtures

    @invalid_attrs %{commits_count: nil, month: nil, repository_id: nil}

    test "list_commits_densities/0 returns all commits_densities" do
      commits_density = commits_density_fixture()
      assert CommitsDensityService.list_commits_densities() == [commits_density]
    end

    # test "get_commits__density!/1 returns the commits__density with given id" do
    #  commits_density = commits_density_fixture()
    #  assert CommitsDensityService.get_commits_density!(commits_density.id) == commits_density
    # end

    test "create_commits__density/1 with valid data creates a commits__density" do
      repository = repository_fixture()
      valid_attrs = %{commits_count: 42, year: 42, month: 42, repository_id: repository.id}

      assert {:ok, %CommitsDensity{} = commits__density} =
               CommitsDensityService.create_commits__density(valid_attrs)

      assert commits__density.commits_count == 42
      assert commits__density.month == 42
      assert commits__density.repository_id == repository.id
    end

    test "create_commits__density/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} =
               CommitsDensityService.create_commits__density(@invalid_attrs)
    end

    #
    test "update_commits__density/2 with valid data updates the commits__density" do
      commits_density = commits_density_fixture()
      repository = repository_fixture()
      update_attrs = %{commits_count: 42, year: 43, month: 43, repository_id: repository.id}

      assert {:ok, %CommitsDensity{} = commits_density} =
               CommitsDensityService.update_commits__density(commits_density, update_attrs)

      assert commits_density.commits_count == 42
      assert commits_density.year == 43
      assert commits_density.month == 43
      assert commits_density.repository_id == repository.id
    end

    # test "update_commits__density/2 with invalid data returns error changeset" do
    #   commits_density = commits_density_fixture()
    #   assert {:error, %Ecto.Changeset{}} = CommitsDensityService.update_commits__density(commits_density, @invalid_attrs)
    #   assert commits_density == CommitsDensityService.get_commits_density!(commits_density.id)
    # end

    # test "delete_commits__density/1 deletes the commits__density" do
    #  commits__density = commits__density_fixture()
    #  assert {:ok, %Commits_Density{}} = CodeRepoService.delete_commits__density(commits__density)
    #  assert_raise Ecto.NoResultsError, fn -> CodeRepoService.get_commits__density!(commits__density.id) end
    # end
    #
    # test "change_commits__density/1 returns a commits__density changeset" do
    #  commits__density = commits__density_fixture()
    #  assert %Ecto.Changeset{} = CodeRepoService.change_commits__density(commits__density)
    # end
  end
end
