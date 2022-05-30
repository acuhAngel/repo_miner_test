defmodule RepoMinerCore.CodeRepoService.CommitsDensityService do
  @moduledoc """
  This module is the Schema of the Repository services.
  """
  import Ecto.Query, warn: false
  alias RepoMinerCore.Repo
  alias RepoMinerCore.CodeRepoService.CommitsDensity

  def get_commits_density!(id) do
    Repo.all(from(c in CommitsDensity, where: c.repository_id == ^id))
  end
end
