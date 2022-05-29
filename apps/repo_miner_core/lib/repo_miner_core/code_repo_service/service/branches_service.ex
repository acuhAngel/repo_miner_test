defmodule RepoMinerCore.CodeRepoService.BranchesService do
  @moduledoc """
   This module is the Schema of the Repository services.
   """
   import Ecto.Query, warn: false
   alias RepoMinerCore.Repo
   alias RepoMinerCore.CodeRepoService.Branches

   def get_branches!(id) do
    Repo.all(from b in Branches, where: b.repository_id == ^id)
   end

 end
