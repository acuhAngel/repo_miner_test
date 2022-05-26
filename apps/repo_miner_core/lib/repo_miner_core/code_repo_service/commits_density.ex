defmodule RepoMinerCore.CodeRepoService.CommitsDensity do
 @moduledoc """
  This module is the Schema of the Table CommitsDensity.
  Has the reltions to oter tables and the valdidations for the fields.
  """
  use Ecto.Schema
  import Ecto.Changeset
  schema "commits_density" do
    field(:year,      :integer)
    field(:january,   :integer)
    field(:february,  :integer)
    field(:march,     :integer)
    field(:april,     :integer)
    field(:may,       :integer)
    field(:june,      :integer)
    field(:july,      :integer)
    field(:august,    :integer)
    field(:september, :integer)
    field(:october,   :integer)
    field(:november,  :integer)
    field(:december,  :integer)

    belongs_to(:repository, RepoMinerCore.CodeRepoService.Repository)
    timestamps()
  end

  @doc false

  def changeset(commits_density, attrs \\ %{}) do
    commits_density
    |> cast(attrs, [
      :year,
      :january, 
      :february,
      :march,   
      :april,   
      :may,     
      :june,    
      :july,    
      :august,  
      :september,
      :october, 
      :november,
      :december,
      :repository_id
      ])
    |> validate_required([:repository_id])
  end
end