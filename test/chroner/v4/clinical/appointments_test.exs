defmodule Chroner.V4.Clinical.AppointmentsTest do
  use Chroner.Support.APICase, api_version: "V4"

  describe "appointments_create/2" do
    test "creates new appointment", %{valid_client: client} do
      use_cassette "appointments_create_success" do
        {:ok, %{data: [%Doctor{id: doctor_id} | _]}} = doctors_list(client)
        {:ok, %{data: [%Patient{id: patient_id} | _]}} = patients_list(client)

        {:ok,
         %{
           data: [
             %Office{id: office_id, exam_rooms: [%ExamRoom{index: exam_room_index} | _]} | _
           ]
         }} = offices_list(client)

        params = %{
          doctor: doctor_id,
          duration: 123,
          exam_room: exam_room_index,
          patient: patient_id,
          reason: "COVID-19",
          office: office_id,
          scheduled_time: "2020-03-30T12:00"
        }

        assert {:ok,
                %Appointment{
                  doctor: ^doctor_id,
                  duration: 123,
                  exam_room: ^exam_room_index,
                  patient: ^patient_id,
                  reason: "COVID-19",
                  office: ^office_id,
                  scheduled_time: ~N[2020-03-30 12:00:00]
                }} = appointments_create(client, params)
      end
    end

    test "fails with incomplete params", %{valid_client: client} do
      use_cassette "appointments_create_400_error" do
        assert {:error,
                %Response{
                  status_code: 400,
                  body: %{
                    "doctor" => ["This field is required."],
                    "exam_room" => ["This field is required."],
                    "office" => ["This field is required."],
                    "patient" => ["This field is required."],
                    "scheduled_time" => ["This field is required."]
                  }
                }} = appointments_create(client, %{})
      end
    end

    test "fails due to auth", %{invalid_client: client} do
      use_cassette "appointments_create_401_error" do
        assert {:error, %Response{status_code: 401}} = appointments_create(client, %{})
      end
    end
  end

  describe "appointments_delete/2" do
    test "deletes new patient", %{valid_client: client} do
      use_cassette "appointments_delete_success" do
        {:ok, %{data: [%Appointment{id: id} | _]}} =
          appointments_list(client, %{date: "2020-03-30"})

        assert :ok = appointments_delete(client, id)
        assert {:error, %Response{status_code: 404}} = appointments_read(client, id)
      end
    end

    test "fails with unexising id", %{valid_client: client} do
      use_cassette "appointments_delete_404_error" do
        assert {:error, %Response{status_code: 404}} = appointments_delete(client, 0)
      end
    end

    test "fails due to auth", %{invalid_client: client} do
      use_cassette "appointments_delete_401_error" do
        assert {:error, %Response{status_code: 401}} = appointments_delete(client, 0)
      end
    end
  end

  describe "appointments_list/2" do
    test "gets all appointments", %{valid_client: client} do
      use_cassette "appointments_list_success", match_requests_on: [:query] do
        assert {:ok, %{data: [%Appointment{} | _]}} =
                 appointments_list(client, %{date: "2020-03-30"})
      end
    end

    test "fails due to auth", %{invalid_client: client} do
      use_cassette "appointments_list_401_error" do
        assert {:error, %Response{status_code: 401}} =
                 appointments_list(client, %{date: "2020-03-30"})
      end
    end
  end

  describe "appointments_partial_update/3" do
    test "partially updates existing patient", %{valid_client: client} do
      use_cassette "appointments_partial_update_success" do
        {:ok, %{data: [%Appointment{id: id, reason: old_reason} | _]}} =
          appointments_list(client, %{date: "2020-03-30"})

        params = %{reason: "Partial New reason"}

        assert :ok = appointments_partial_update(client, id, params)
        assert {:ok, %Appointment{reason: new_reason}} = appointments_read(client, id)
        refute new_reason == old_reason
      end
    end

    test "fails with incomplete params", %{valid_client: client} do
      use_cassette "appointments_partial_update_400_error" do
        {:ok, %{data: [%Appointment{id: id} | _]}} =
          appointments_list(client, %{date: "2020-03-30"})

        assert :ok = appointments_partial_update(client, id, %{})
      end
    end

    test "fails to update unexisting patient", %{valid_client: client} do
      use_cassette "appointments_partial_update_404_error" do
        assert {:error, %Response{status_code: 404}} = appointments_partial_update(client, 0, %{})
      end
    end

    test "fails due to auth", %{invalid_client: client} do
      use_cassette "appointments_partial_update_401_error" do
        assert {:error, %Response{status_code: 401}} = appointments_partial_update(client, 0, %{})
      end
    end
  end

  describe "appointments_read/2" do
    test "gets existing user by id", %{valid_client: client} do
      use_cassette "appointments_read_success" do
        {:ok, %{data: [%Appointment{id: id} | _]}} =
          appointments_list(client, %{date: "2020-03-30"})

        assert {:ok, %Appointment{id: ^id}} = appointments_read(client, id)
      end
    end

    test "fails due to unexisting user", %{valid_client: client} do
      use_cassette "appointments_read_404_error" do
        assert {:error, %Response{status_code: 404}} = appointments_read(client, 0)
      end
    end

    test "fails due to auth", %{valid_client: valid_client, invalid_client: invalid_client} do
      use_cassette "appointments_read_401_error" do
        {:ok, %{data: [%Appointment{id: id} | _]}} =
          appointments_list(valid_client, %{date: "2020-03-30"})

        assert {:error, %Response{status_code: 401}} = appointments_read(invalid_client, id)
      end
    end
  end

  describe "appointments_update/3" do
    test "updates existing patient", %{valid_client: client} do
      use_cassette "appointments_update_success" do
        {:ok,
         %{
           data: [
             %Appointment{
               id: id,
               doctor: doctor_id,
               duration: duration,
               exam_room: exam_room,
               office: office_id,
               patient: patient_id,
               scheduled_time: scheduled_time,
               reason: old_reason
             }
             | _
           ]
         }} = appointments_list(client, %{date: "2020-03-30"})

        params = %{
          doctor: doctor_id,
          duration: duration,
          exam_room: exam_room,
          office: office_id,
          patient: patient_id,
          scheduled_time: scheduled_time,
          reason: "New reason"
        }

        assert :ok = appointments_update(client, id, params)
        assert {:ok, %Appointment{reason: new_reason}} = appointments_read(client, id)
        refute new_reason == old_reason
      end
    end

    test "fails with incomplete params", %{valid_client: client} do
      use_cassette "appointments_update_400_error" do
        {:ok, %{data: [%Appointment{id: id} | _]}} =
          appointments_list(client, %{date: "2020-03-30"})

        assert {:error,
                %Response{
                  status_code: 400,
                  body: %{
                    "doctor" => ["This field is required."],
                    "exam_room" => ["This field is required."],
                    "office" => ["This field is required."],
                    "patient" => ["This field is required."],
                    "scheduled_time" => ["This field is required."]
                  }
                }} = appointments_update(client, id, %{})
      end
    end

    test "fails to update unexisting patient", %{valid_client: client} do
      use_cassette "appointments_update_404_error" do
        assert {:error, %Response{status_code: 404}} = appointments_update(client, 0, %{})
      end
    end

    test "fails due to auth", %{invalid_client: client} do
      use_cassette "appointments_update_401_error" do
        assert {:error, %Response{status_code: 401}} = appointments_update(client, 0, %{})
      end
    end
  end
end
