defmodule RepoMinerWebWeb.RepositoryController do
  use RepoMinerWebWeb, :controller

  alias RepoMinerCore.CodeRepoService.RepositoryService
  alias RepoMinerCore.CodeRepoService.BranchesService
  alias RepoMinerCore.CodeRepoService.UserCommitsService
  alias RepoMinerCore.CodeRepoService.CommitsDensityService

  # alias RepoMinerWeb.Respository
  # alias RepoMinerWeb.Respository.Repository

  def list_repos(conn, _params) do
    repositories = RepositoryService.list_repository()
    render(conn, "list_repos.html", repositories: repositories)
  end

  def new_analysis(conn, _params) do
    render(conn, "new_analysis.html")
  end

  def create_analysis(conn, _params) do
    render(conn, "show_analysis.hmtl")
  end

  def again_analysis(conn, _params) do
    render(conn, "again_analysis.html")
  end

  def create_again_analysis(conn, _params) do
    render(conn, "show_analysis.hmtl")
  end

  def show_analysis(conn, %{"id" => id}) do
    repository = RepositoryService.get_repository!(id)
    branches = BranchesService.get_branches!(repository.id)
    render(conn, "show_analysis.html", repository: repository, branches: branches)
  end

  def list_commit_user(conn, %{"id" => id}) do
    repository = RepositoryService.get_repository!(id)
    user_commits = UserCommitsService.get_user_commits!(repository.id)
    render(conn, "list_commit_user.html", repository: repository, user_commits: user_commits)
  end

  def list_commit_density(conn, %{"id" => id}) do
    repository = RepositoryService.get_repository!(id)
    commits_density = CommitsDensityService.get_commits_density!(repository.id)

    render(conn, "list_commit_density.html", repository: repository, commits_density: commits_density)
  end
end
