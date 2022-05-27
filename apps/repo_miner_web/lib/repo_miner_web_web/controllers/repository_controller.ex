defmodule RepoMinerWebWeb.RepositoryController do
  use RepoMinerWebWeb, :controller

  # alias RepoMinerWeb.Respository
  # alias RepoMinerWeb.Respository.Repository

  def list_repos(conn, _params) do
    render(conn, "list_repos.html")
  end
end
