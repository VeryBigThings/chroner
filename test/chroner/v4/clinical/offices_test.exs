defmodule Chroner.V4.Clinical.OfficesTest do
  use Chroner.Support.APICase, api_version: "V4"

  describe "offices_add_exam_room/3" do
    # TODO: add `adds new exam room for existing office` test

    test "fails due to maximum number of exam rooms", %{valid_client: client} do
      use_cassette "offices_add_exam_room_400_error" do
        {:ok, [%Office{id: id} | _]} = offices_list(client)

        params = %{name: "New exam room", online_scheduling: true}

        assert {:error, %Response{body: ["Office already has the maximum number of exam rooms"]}} =
                 offices_add_exam_room(client, id, params)
      end
    end

    test "fails to add exam rooms for unexisting office", %{valid_client: client} do
      use_cassette "offices_add_exam_room_404_error" do
        assert {:error, %Response{status_code: 404}} = offices_add_exam_room(client, 0, %{})
      end
    end

    test "fails due to auth", %{invalid_client: client} do
      use_cassette "offices_add_exam_room_401_error" do
        assert {:error, %Response{status_code: 401}} = offices_add_exam_room(client, 0, %{})
      end
    end
  end

  describe "offices_list/2" do
    test "gets all offices", %{valid_client: client} do
      use_cassette "offices_list_success", match_requests_on: [:query] do
        assert {:ok, [%Office{} | _]} = offices_list(client)
      end
    end

    test "fails due to auth", %{invalid_client: client} do
      use_cassette "offices_list_401_error" do
        assert {:error, %Response{status_code: 401}} = offices_list(client)
      end
    end
  end

  describe "offices_read/2" do
    test "gets existing user by id", %{valid_client: client} do
      use_cassette "offices_read_success" do
        {:ok, [%Office{id: id} | _]} = offices_list(client)
        assert {:ok, %Office{id: ^id}} = offices_read(client, id)
      end
    end

    test "fails due to unexisting user", %{valid_client: client} do
      use_cassette "offices_read_404_error" do
        assert {:error, %Response{status_code: 404}} = offices_read(client, 0)
      end
    end

    test "fails due to auth", %{valid_client: valid_client, invalid_client: invalid_client} do
      use_cassette "offices_read_401_error" do
        {:ok, [%Office{id: id} | _]} = offices_list(valid_client)
        assert {:error, %Response{status_code: 401}} = offices_read(invalid_client, id)
      end
    end
  end

  describe "offices_partial_update/3" do
    test "updates existing office", %{valid_client: client} do
      use_cassette "offices_partial_update_success" do
        {:ok, [%Office{id: id, online_scheduling: old_online_scheduling} | _]} =
          offices_list(client)

        params = %{online_scheduling: !old_online_scheduling}

        assert :ok = offices_partial_update(client, id, params)
        assert {:ok, %Office{online_scheduling: new_online_scheduling}} = offices_read(client, id)
        refute old_online_scheduling == new_online_scheduling
      end
    end

    test "succeds with empty params", %{valid_client: client} do
      use_cassette "offices_partial_update_400_error" do
        {:ok, [%Office{id: id} | _]} = offices_list(client)

        assert :ok = offices_partial_update(client, id, %{})
      end
    end

    test "fails to update unexisting office", %{valid_client: client} do
      use_cassette "offices_partial_update_404_error" do
        assert {:error, %Response{status_code: 404}} = offices_partial_update(client, 0, %{})
      end
    end

    test "fails due to auth", %{invalid_client: client} do
      use_cassette "offices_partial_update_401_error" do
        assert {:error, %Response{status_code: 401}} = offices_partial_update(client, 0, %{})
      end
    end
  end
end
