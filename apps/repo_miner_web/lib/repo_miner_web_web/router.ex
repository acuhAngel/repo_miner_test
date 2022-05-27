defmodule RepoMinerWebWeb.Router do
  use RepoMinerWebWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {RepoMinerWebWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RepoMinerWebWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/repos", RepositoryController, :list_repos
  end

  # Other scopes may use custom stacks.
  # scope "/api", RepoMinerWebWeb do
  #   pipe_through :api
  # end
end
