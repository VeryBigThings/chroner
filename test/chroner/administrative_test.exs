defmodule Chroner.AdministrativeTest do
  use Chroner.Support.ClientCase

  import Chroner.Administrative

  alias Chroner.Administrative.{Doctor, User}

  # --------------------------------------------------------------------
  # Doctors
  # --------------------------------------------------------------------

  describe "doctors_list/1" do
    test "gets all doctors", %{valid_client: client} do
      use_cassette "doctors_list_success" do
        assert {:ok, [%Doctor{} | _]} = doctors_list(client)
      end
    end

    test "fails due to auth", %{invalid_client: client} do
      use_cassette "doctors_list_error" do
        assert {:error, %Response{status_code: 401}} = doctors_list(client)
      end
    end
  end

  describe "doctors_read/2" do
    test "gets existing user by id", %{valid_client: client} do
      use_cassette "doctors_read_success" do
        {:ok, [%Doctor{id: id} | _]} = doctors_list(client)
        assert {:ok, %Doctor{id: ^id}} = doctors_read(client, id)
      end
    end

    test "fails due to unexisting user", %{valid_client: client} do
      use_cassette "doctors_read_404_error" do
        assert {:error, %Response{status_code: 404}} = doctors_read(client, 0)
      end
    end

    test "fails due to auth", %{valid_client: valid_client, invalid_client: invalid_client} do
      use_cassette "doctors_read_401_error" do
        {:ok, [%Doctor{id: id} | _]} = doctors_list(valid_client)
        assert {:error, %Response{status_code: 401}} = doctors_read(invalid_client, id)
      end
    end
  end

  # --------------------------------------------------------------------
  # Users
  # --------------------------------------------------------------------

  describe "users_current/1" do
    test "gets current user", %{valid_client: client} do
      use_cassette "users_current_success" do
        assert {:ok, %User{}} = users_current(client)
      end
    end

    test "fails due to auth", %{invalid_client: client} do
      use_cassette "users_current_error" do
        assert {:error, %Response{status_code: 401}} = users_current(client)
      end
    end
  end

  describe "users_list/1" do
    test "gets all users", %{valid_client: client} do
      use_cassette "users_list_success" do
        assert {:ok, [%User{} | _]} = users_list(client)
      end
    end

    test "fails due to auth", %{invalid_client: client} do
      use_cassette "users_list_error" do
        assert {:error, %Response{status_code: 401}} = users_list(client)
      end
    end
  end

  describe "users_read/2" do
    test "gets existing user by id", %{valid_client: client} do
      use_cassette "users_read_success" do
        {:ok, %User{id: id}} = users_current(client)
        assert {:ok, %User{id: ^id}} = users_read(client, id)
      end
    end

    test "fails due to unexisting user", %{valid_client: client} do
      use_cassette "users_read_404_error" do
        assert {:error, %Response{status_code: 404}} = users_read(client, 0)
      end
    end

    test "fails due to auth", %{valid_client: valid_client, invalid_client: invalid_client} do
      use_cassette "users_read_401_error" do
        {:ok, %User{id: id}} = users_current(valid_client)
        assert {:error, %Response{status_code: 401}} = users_read(invalid_client, id)
      end
    end
  end

  # --------------------------------------------------------------------
  # User Groups
  # --------------------------------------------------------------------

  describe "user_groups_list/1" do
    test "gets all user_groups", %{valid_client: client} do
      use_cassette "user_groups_list_success" do
        assert {:ok, []} = user_groups_list(client)
      end
    end

    test "fails due to auth", %{invalid_client: client} do
      use_cassette "user_list_error" do
        assert {:error, %Response{status_code: 401}} = user_groups_list(client)
      end
    end
  end

  describe "user_groups_read/2" do
    # TODO: `gets existing user_group by id` test

    test "fails due to unexisting user_groups", %{valid_client: client} do
      use_cassette "user_groups_read_404_error" do
        assert {:error, %Response{status_code: 404}} = user_groups_read(client, 0)
      end
    end

    test "fails due to auth", %{invalid_client: invalid_client} do
      use_cassette "user_groups_read_401_error" do
        assert {:error, %Response{status_code: 401}} = user_groups_read(invalid_client, 0)
      end
    end
  end
end
