defmodule RepoMinerCore.CodeRepoService.UserCommitsService do
  @moduledoc """
   This module is the Schema of the Repository services.
   """
   import Ecto.Query, warn: false
   alias RepoMinerCore.Repo
   alias RepoMinerCore.CodeRepoService.UserCommits
   def get_user_commits!(id) do
    Repo.all(from u in UserCommits, where: u.repository_id == ^id)
   end

 end
