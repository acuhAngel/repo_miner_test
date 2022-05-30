defmodule RepoMinerCore.BranchesServiceTest do
  use RepoMinerCore.DataCase

  alias RepoMinerCore.CodeRepoService.BranchesService

  describe "branches" do
    alias RepoMinerCore.CodeRepoService.Branches

    import RepoMinerCore.BranchesServiceFixtures

    @invalid_attrs %{commits_count: nil, name: nil, repository_id: nil}

    test "list_branches/0 returns all branches" do
      branch = branch_fixture()
      assert BranchesService.list_branches() == [branch]
    end

    # test "get_branches!/1 returns the branch with given id" do
    #   branch = branch_fixture()
    #   assert BranchesService.get_branches!(branch.id) == branch
    # end

    test "create_branch/1 with valid data creates a branch" do
      repository = repository_fixture()
      valid_attrs = %{commits_count: 42, name: "some name", repository_id: repository.id}

      assert {:ok, %Branches{} = branch} = BranchesService.create_branch(valid_attrs)
      assert branch.commits_count == 42
      assert branch.name == "some name"
      assert branch.repository_id == repository.id
    end

    test "create_branch/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BranchesService.create_branch(@invalid_attrs)
    end

    test "update_branch/2 with valid data updates the branch" do
      branch = branch_fixture()
      repository = repository_fixture()
      update_attrs = %{commits_count: 43, name: "some updated name", repository_id: repository.id}
      assert {:ok, %Branches{} = branch} = BranchesService.update_branch(branch, update_attrs)
      assert branch.commits_count == 43
      assert branch.name == "some updated name"
      assert branch.repository_id == repository.id
    end

    # test "update_branch/2 with invalid data returns error changeset" do
    #   branch = branch_fixture()
    #   assert {:error, %Ecto.Changeset{}} = BranchesService.update_branch(branch, @invalid_attrs)
    #   assert branch == BranchesService.get_branch!(branch.id)
    # end

    # test "delete_branch/1 deletes the branch" do
    #   branch = branch_fixture()
    #   assert {:ok, %Branches{}} = BranchesService.delete_branch(branch)
    #   assert_raise Ecto.NoResultsError, fn -> BranchesService.get_branch!(branch.id) end
    # end

    test "change_branch/1 returns a branch changeset" do
      branch = branch_fixture()
      assert %Ecto.Changeset{} = BranchesService.change_branch(branch)
    end
  end
end
