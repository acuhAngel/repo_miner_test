defmodule RepoMinerAnalysis.MixProject do
  use Mix.Project

  def project do
    [
      app: :repo_miner_analysis,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {RepoMinerAnalysis.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      # {:sibling_app_in_umbrella, in_umbrella: true}
      {:jason, "~> 1.2"},
      {:poolboy, "~> 1.5"},
      {:amqp, "~> 3.1"},
      {:repo_miner_core, in_umbrella: true},
      {:repo_miner_py, git: "https://github.com/MachinesAreUs/repo_miner_py.git"}
    ]
  end
end
