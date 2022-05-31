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
        clean_registers(repo_map["repo_id"])
        set_status(repo_map["repo_id"], :ready)
        write_commits_on_main(repo_info.num_commits, repo_map["repo_id"])
        write_histogram(repo_info.monthly_commits_histogram, repo_map["repo_id"])
        write_user_commits(repo_info.user_commits_histogram, repo_map["repo_id"])
        :ok

      {:error, _error_msg} ->
        set_status(repo_map["repo_id"], :error)
        :error
    end
  end

  defp clean_registers(repo_id) do
    Enum.each(
      CodeRepoService.CommitsDensityService.get_commits_density!(repo_id),
      &CodeRepoService.CommitsDensityService.delete_commits__density/1
    )

    Enum.each(
      CodeRepoService.UserCommitsService.get_user_commits!(repo_id),
      &CodeRepoService.UserCommitsService.delete_users__commits/1
    )
  end

  defp set_status(repo_id, status) do
    CodeRepoService.StatusService.get_status!(repo_id)
    |> CodeRepoService.StatusService.update_status(%{state: status})
  end

  def write_commits_on_main(total_commits, repo_id) do
    repo = CodeRepoService.RepositoryService.get_repository!(repo_id)

    CodeRepoService.RepositoryService.update_repository(repo, %{main_commits_count: total_commits})
  end

  defp write_histogram(monthly_commits_histogram, repo_id) do
    Enum.each(monthly_commits_histogram, fn {{year, month}, num_commits} ->
      CodeRepoService.CommitsDensityService.create_commits__density(%{
        year: year,
        month: month,
        commits_count: num_commits,
        repository_id: repo_id
      })
    end)
  end

  defp write_user_commits(user_commits_histogram, repo_id) do
    Enum.each(user_commits_histogram, fn {user, user_commits} ->
      CodeRepoService.UserCommitsService.create_users__commits(%{
        username: user,
        commits_count: user_commits,
        repository_id: repo_id
      })
    end)
  end
end
