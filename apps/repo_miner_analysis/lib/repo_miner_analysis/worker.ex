defmodule RepoMinerAnalysis.Worker do
  @moduledoc """
    Repo Analyzer process pool worker.
  """

  alias RepoMinerCore.CodeRepoService
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil)
  end

  @impl true
  def init(_) do
    {:ok, miner_py_pid} = RepoMinerPy.RepoMiner.start_link(name: nil)
    {:ok, miner_py_pid}
  end

  @impl true
  def handle_cast({:analyze, repo_json}, miner_py_pid) do
    IO.puts("OK")
    call_analyzer(repo_json, miner_py_pid)
    {:noreply, miner_py_pid}
  end

  defp call_analyzer(repo_map, miner_py_pid) do
    result =
      GenServer.call(
        miner_py_pid,
        {:analyze, repo_url: repo_map["repo_url"], token: repo_map["token"]},
        60_000
      )

    case result do
      {:ok, repo_info} ->
        # Write result and successful state to database
        IO.puts(inspect(repo_info))
        :ok

        # Set status as ready
        CodeRepoService.StatusService.get_status!(repo_map["repo_id"])
        |> CodeRepoService.StatusService.update_status(%{status: "ready"})

        # Write histogram
        Enum.each(repo_info.monthly_commits_histogram, fn {{year, month}, num_commits} ->
          CodeRepoService.CommitsDensityService.create_commits__density(%{
            year: year,
            month: month,
            commits_count: num_commits,
            repository_id: repo_map["repo_id"]
          })
        end)

        # Write commits by user
        Enum.each(repo_info.user_commits_histogram, fn {user, user_commits} ->
          CodeRepoService.UserCommitsService.create_users__commits(%{
            username: user,
            commits_count: user_commits,
            repository_id: repo_map["repo_id"]
          })
        end)

      {:error, _error_msg} ->
        # write error state to database
        :error
    end
  end
end
