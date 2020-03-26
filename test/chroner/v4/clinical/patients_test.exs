defmodule Chroner.V4.Clinical.PatientsTest do
  use Chroner.Support.APICase, api_version: "V4"

  describe "patients_create/2" do
    test "creates new patient", %{valid_client: client} do
      use_cassette "patients_create_success" do
        {:ok, %{data: [%Doctor{id: doctor_id} | _]}} = doctors_list(client)

        params = %{
          doctor: doctor_id,
          first_name: "Chroner",
          gender: :Male,
          last_name: "Test"
        }

        assert {:ok,
                %Patient{
                  doctor: ^doctor_id,
                  first_name: "Chroner",
                  gender: "Male",
                  last_name: "Test"
                }} = patients_create(client, params)
      end
    end

    test "fails with incomplete params", %{valid_client: client} do
      use_cassette "patients_create_400_error" do
        assert {:error,
                %Response{
                  status_code: 400,
                  body: %{
                    "doctor" => ["This field is required."],
                    "gender" => ["This field is required."]
                  }
                }} = patients_create(client, %{})
      end
    end

    test "fails due to auth", %{invalid_client: client} do
      use_cassette "patients_create_401_error" do
        assert {:error, %Response{status_code: 401}} = patients_create(client, %{})
      end
    end
  end

  describe "patients_delete/2" do
    test "deletes new patient", %{valid_client: client} do
      use_cassette "patients_delete_success" do
        {:ok, %{data: [%Patient{id: id} | _]}} = patients_list(client)

        assert :ok = patients_delete(client, id)
        assert {:error, %Response{status_code: 404}} = patients_read(client, id)
      end
    end

    test "fails with unexising id", %{valid_client: client} do
      use_cassette "patients_delete_404_error" do
        assert {:error, %Response{status_code: 404}} = patients_delete(client, 0)
      end
    end

    test "fails due to auth", %{invalid_client: client} do
      use_cassette "patients_delete_401_error" do
        assert {:error, %Response{status_code: 401}} = patients_delete(client, 0)
      end
    end
  end

  describe "patients_list/2" do
    test "gets all patients with filters", %{valid_client: client} do
      use_cassette "patients_list_success", match_requests_on: [:query] do
        assert {:ok,
                %{
                  data: [
                    %Patient{last_name: "Test"},
                    %Patient{last_name: "Test"},
                    %Patient{last_name: "Test"},
                    %Patient{last_name: "Test"}
                  ]
                }} = patients_list(client, %{last_name: "test"})

        assert {:ok, %{data: [%Patient{first_name: "Chris"}, %Patient{first_name: "Chrissy"}]}} =
                 patients_list(client, %{first_name: "chris"})
      end
    end

    test "fails due to auth", %{invalid_client: client} do
      use_cassette "patients_list_401_error" do
        assert {:error, %Response{status_code: 401}} = patients_list(client)
      end
    end
  end

  describe "patients_read/2" do
    test "gets existing user by id", %{valid_client: client} do
      use_cassette "patients_read_success" do
        {:ok, %{data: [%Patient{id: id} | _]}} = patients_list(client)
        assert {:ok, %Patient{id: ^id}} = patients_read(client, id)
      end
    end

    test "fails due to unexisting user", %{valid_client: client} do
      use_cassette "patients_read_404_error" do
        assert {:error, %Response{status_code: 404}} = patients_read(client, 0)
      end
    end

    test "fails due to auth", %{valid_client: valid_client, invalid_client: invalid_client} do
      use_cassette "patients_read_401_error" do
        {:ok, %{data: [%Patient{id: id} | _]}} = patients_list(valid_client)
        assert {:error, %Response{status_code: 401}} = patients_read(invalid_client, id)
      end
    end
  end

  describe "patients_update/3" do
    test "updates existing patient", %{valid_client: client} do
      use_cassette "patients_update_success" do
        {:ok,
         %{
           data: [
             %Patient{first_name: old_first_name, doctor: doctor, gender: gender, id: id} | _
           ]
         }} = patients_list(client)

        params = %{doctor: doctor, first_name: "Updated", gender: gender}

        assert :ok = patients_update(client, id, params)
        assert {:ok, %Patient{first_name: new_first_name}} = patients_read(client, id)
        assert new_first_name == params.first_name
        refute old_first_name == new_first_name
      end
    end

    test "fails with incomplete params", %{valid_client: client} do
      use_cassette "patients_update_400_error" do
        {:ok, %{data: [%Patient{id: id} | _]}} = patients_list(client)

        assert {:error,
                %Response{
                  status_code: 400,
                  body: %{
                    "doctor" => ["This field is required."],
                    "gender" => ["This field is required."]
                  }
                }} = patients_update(client, id, %{})
      end
    end

    test "fails to update unexisting patient", %{valid_client: client} do
      use_cassette "patients_update_404_error" do
        assert {:error, %Response{status_code: 404}} = patients_update(client, 0, %{})
      end
    end

    test "fails due to auth", %{invalid_client: client} do
      use_cassette "patients_update_401_error" do
        assert {:error, %Response{status_code: 401}} = patients_update(client, 0, %{})
      end
    end
  end
end
