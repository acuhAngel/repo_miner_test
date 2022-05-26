defmodule RepoMinerAnalysis.Worker do
  @moduledoc """
    Repo Analyzer process pool worker.
  """

  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    {:ok, :ready}
  end

  def handle_cast(
        {:analyze,
         %{
           provider: _provider,
           username: _username,
           repo: _repo,
           visibility: :public
         }},
        _state
      ) do
    IO.puts("Analyzing public repo")
    Process.sleep(1000)
    {:noreply, :ready}
  end

  def handle_cast(
        {:analyze,
         %{
           provider: _provider,
           username: _username,
           repo: _repo,
           visibility: :private,
           token: _token
         }},
        _state
      ) do
    IO.puts("Analyzing private repo")
    Process.sleep(1000)
    {:no_reply, :ok}
  end
end
