defmodule Chroner.Clinical.AppointmentProfilesTest do
  use Chroner.Support.APICase

  describe "appointment_profiles_create/2" do
    test "creates new appointment profile", %{valid_client: client} do
      use_cassette "appointment_profiles_create_success" do
        {:ok, [%Doctor{id: doctor_id} | _]} = doctors_list(client)

        params = %{
          color: "#7B7B7B",
          doctor: doctor_id,
          duration: 123,
          name: "Test name",
          online_scheduling: true,
          reason: "Reason"
        }

        assert {:ok,
                %AppointmentProfile{
                  color: "#7B7B7B",
                  doctor: ^doctor_id,
                  duration: 123,
                  name: "Test name",
                  online_scheduling: true,
                  reason: "Reason"
                }} = appointment_profiles_create(client, params)
      end
    end

    test "fails with incomplete params", %{valid_client: client} do
      use_cassette "appointment_profiles_create_400_error" do
        assert {:error,
                %Response{
                  status_code: 400,
                  body: %{
                    "color" => ["This field is required."],
                    "name" => ["This field is required."]
                  }
                }} = appointment_profiles_create(client, %{})
      end
    end

    test "fails due to auth", %{invalid_client: client} do
      use_cassette "appointment_profiles_create_401_error" do
        assert {:error, %Response{status_code: 401}} = appointment_profiles_create(client, %{})
      end
    end
  end

  describe "appointment_profiles_list/2" do
    # TODO: `gets all existing appointment profiles` test

    test "fails due to auth", %{invalid_client: client} do
      use_cassette "appointment_profiles_list_401_error" do
        assert {:error, %Response{status_code: 401}} = appointment_profiles_list(client)
      end
    end
  end

  describe "appointment_profiles_read/2" do
    # TODO: `gets existing appointment profile by id` test

    test "fails due to unexisting appointment profile", %{valid_client: client} do
      use_cassette "appointment_profiles_read_404_error" do
        assert {:error, %Response{status_code: 404}} = appointment_profiles_read(client, 0)
      end
    end

    test "fails due to auth", %{invalid_client: invalid_client} do
      use_cassette "appointment_profiles_read_401_error" do
        assert {:error, %Response{status_code: 401}} =
                 appointment_profiles_read(invalid_client, 0)
      end
    end
  end

  describe "appointment_profiles_update/3" do
    # TODO: `updates existing appointment profile` test
    # TODO: `fails with incomplete params` test
    # TODO: `fails to update unexisting appointment profile` test
    # TODO: `fails due to auth` test
  end

  describe "appointment_profiles_partial_update/3" do
    # TODO: `partialy updates existing appointment profile` test
    # TODO: `fails with incomplete params` test
    # TODO: `fails to update unexisting appointment profile` test
    # TODO: `fails due to auth` test
  end
end
