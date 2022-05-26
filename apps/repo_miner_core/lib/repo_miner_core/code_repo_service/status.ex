defmodule RepoMinerCore.CodeRepoService.Status do
  @moduledoc """
  This module is the Schema of the Table Status.
  Has the reltions to oter tables and the valdidations for the fields.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "status" do
    field(:state, Ecto.Enum, values: [:ready, :pending, :error])
    # belongs to repositories
    timestamps()
  end

  @doc false

  def changeset(status, attrs \\ %{}) do
    status
    |> cast(attrs, [:state])
    |> validate_required([:state])
  end
end
