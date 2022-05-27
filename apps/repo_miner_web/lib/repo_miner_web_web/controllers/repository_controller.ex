defmodule RepoMinerWebWeb.RepositoryController do
  use RepoMinerWebWeb, :controller

  # alias RepoMinerWeb.Respository
  # alias RepoMinerWeb.Respository.Repository

  def list_repos(conn, _params) do
    render(conn, "list_repos.html")
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

  def show_analysis(conn, _params) do
    render(conn, "show_analysis.html")
  end

  def list_commit_user(conn, _params) do
    render(conn, "list_commit_user.html")
  end

  def list_commit_density(conn, _params) do
    render(conn, "list_commit_density.html")
  end
end
