defmodule RepoMinerWebWeb.PageController do
  use RepoMinerWebWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
