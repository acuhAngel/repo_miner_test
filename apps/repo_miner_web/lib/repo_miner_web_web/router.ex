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
    get "/new_analysis", RepositoryController, :new_analysis
    post "/repos", RepositoryController, :create_analysis
    get "/again_analysis", RepositoryController, :again_analysis
    put "/repos", RepositoryController, :create_again_analysis
    get "/show_analysis", RepositoryController, :show_analysis
    get "/list_commit_user", RepositoryController, :list_commit_user
    get "/list_commit_density", RepositoryController, :list_commit_density
  end

  # Other scopes may use custom stacks.
  # scope "/api", RepoMinerWebWeb do
  #   pipe_through :api
  # end
end
