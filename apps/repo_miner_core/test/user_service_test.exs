defmodule RepoMinerCore.UserServiceTest do
  use RepoMinerCore.DataCase

  alias RepoMinerCore.UserService

  describe "users" do
    alias RepoMinerCore.UserService.User

    import RepoMinerCore.UserServiceFixtures

    @invalid_attrs %{email: nil, handle: nil, name: nil, role: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert UserService.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert UserService.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", handle: "some handle", name: "some name", role: :admin}

      assert {:ok, %User{} = user} = UserService.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.handle == "some handle"
      assert user.name == "some name"
      assert user.role == :admin
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = UserService.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()

      update_attrs = %{
        email: "some updated email",
        handle: "some updated handle",
        name: "some updated name",
        role: :admin
      }

      assert {:ok, %User{} = user} = UserService.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.handle == "some updated handle"
      assert user.name == "some updated name"
      assert user.role == :admin
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = UserService.update_user(user, @invalid_attrs)
      assert user == UserService.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = UserService.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> UserService.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = UserService.change_user(user)
    end
  end
end
