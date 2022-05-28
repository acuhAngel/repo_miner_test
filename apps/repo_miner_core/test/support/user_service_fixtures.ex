defmodule RepoMinerCore.UserServiceFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RepoMinerCore.UserService` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        handle: "some handle",
        name: "some name",
        role: :admin
      })
      |> RepoMinerCore.UserService.create_user()

    user
  end
end
