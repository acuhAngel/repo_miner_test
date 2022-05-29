defmodule RepoMinerCore.CodeRepoService.Statuses do
  @moduledoc """
  This module is the Schema of the Table Status.
  Has the reltions to oter tables and the valdidations for the fields.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "statuses" do
    field(:status, Ecto.Enum, values: [:ready, :pending, :error])
    belongs_to(:repository, RepoMinerCore.CodeRepoService.Repository)
    timestamps()
  end

  @doc false

  def changeset(status, attrs) do
    status
    |> cast(attrs, [:repository_id, :status])
    |> validate_required([:repository_id, :status])
  end
end
