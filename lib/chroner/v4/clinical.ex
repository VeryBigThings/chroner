defmodule Chroner.V4.Clinical do
  @moduledoc """
  Create and manage clinical resources.
  """

  import Chroner.V4.Resource

  alias __MODULE__.{Appointment, AppointmentProfile, ExamRoom, Patient, Office}
  alias Office.ExamRoom
  alias OAuth2.{Client, Response}

  @type id :: integer()
  @type client :: OAuth2.Client.t()
  @type error :: {:error, OAuth2.Response.t()}
  @type next :: String.t()
  @type previous :: String.t()

  # --------------------------------------------------------------------
  # Appointments
  # --------------------------------------------------------------------

  @doc "Creates new appointment resource."
  @spec appointments_create(client, Appointment.upsert_params()) ::
          {:ok, Appointment.t()} | error
  def appointments_create(client, params), do: create(client, params, Appointment)

  @doc "Deletes appointment resource by ID."
  @spec appointments_delete(client, id) ::
          :ok | error
  def appointments_delete(client, id), do: delete(client, id, Appointment)

  @doc "Fetches all appointment resources."
  @spec appointments_list(client, Appointment.list_params() | %{}) ::
          {:ok, %{data: [Appointment.t()] | [], next: next, previous: previous}} | error
  def appointments_list(client, params), do: list(client, Appointment, params)

  @doc "Partialky updates existing appointment resource by ID and params."
  @spec appointments_partial_update(client, id, Appointment.partial_update_params()) ::
          :ok | error
  def appointments_partial_update(client, id, params),
    do: partial_update(client, id, params, Appointment)

  @doc "Fetches appointment resource by ID."
  @spec appointments_read(client, id) :: {:ok, Appointment.t()} | error
  def appointments_read(client, id), do: read(client, id, Appointment)

  @doc "Updates existing appointment resource by ID and params."
  @spec appointments_update(client, id, Appointment.upsert_params()) :: :ok | error
  def appointments_update(client, id, params), do: update(client, id, params, Appointment)

  # --------------------------------------------------------------------
  # Appointment Profiles
  # --------------------------------------------------------------------

  @doc "Creates new appointment_profile resource."
  @spec appointment_profiles_create(client, AppointmentProfile.upsert_params()) ::
          {:ok, AppointmentProfile.t()} | error
  def appointment_profiles_create(client, params), do: create(client, params, AppointmentProfile)

  @doc "Deletes appointment_profile resource by ID."
  @spec appointment_profiles_delete(client, id) ::
          :ok | error
  def appointment_profiles_delete(client, id), do: delete(client, id, AppointmentProfile)

  @doc "Fetches all appointment_profile resources."
  @spec appointment_profiles_list(client, AppointmentProfile.list_params() | %{}) ::
          {:ok, %{data: [AppointmentProfile.t()] | [], next: next, previous: previous}} | error
  def appointment_profiles_list(client, params \\ %{}),
    do: list(client, AppointmentProfile, params)

  @doc "Partially updates existing appointment_profile resource by ID and params."
  @spec appointment_profiles_partial_update(
          client,
          id,
          AppointmentProfile.partial_update_params()
        ) ::
          {:ok, AppointmentProfile.t()} | error
  def appointment_profiles_partial_update(client, id, params),
    do: partial_update(client, id, params, AppointmentProfile)

  @doc "Fetches appointment_profile resource by ID."
  @spec appointment_profiles_read(client, id) ::
          {:ok, AppointmentProfile.t()} | error
  def appointment_profiles_read(client, id), do: read(client, id, AppointmentProfile)

  @doc "Updates existing appointment_profile resource by ID and params."
  @spec appointment_profiles_update(client, id, AppointmentProfile.upsert_params()) ::
          {:ok, AppointmentProfile.t()} | error
  def appointment_profiles_update(client, id, params),
    do: update(client, id, params, AppointmentProfile)

  # --------------------------------------------------------------------
  # Patients
  # --------------------------------------------------------------------

  @doc "Retrieve patient CCDA."
  @spec patients_ccda(client, integer(), Patient.list_params()) :: {:ok, String.t()} | error
  def patients_ccda(client, id, params) do
    with {:ok, %Response{body: data}} <-
           Client.get(
             client,
             "/patients/#{id}/ccda",
             [{"accept", "application/xml"}],
             params: params
           ),
         do: {:ok, data}
  end

  @doc "Creates new patient resource."
  @spec patients_create(client, Patient.upsert_params()) ::
          {:ok, Patient.t()} | error
  def patients_create(client, params), do: create(client, params, Patient)

  @doc "Deletes patient resource by ID."
  @spec patients_delete(client, id) ::
          :ok | error
  def patients_delete(client, id), do: delete(client, id, Patient)

  @doc "Fetches all patient resources."
  @spec patients_list(client, Patient.list_params() | %{}) ::
          {:ok, %{data: [Patient.t()] | [], next: next, previous: previous}} | error
  def patients_list(client, params \\ %{}), do: list(client, Patient, params)

  @doc "Fetches patient resource by ID."
  @spec patients_read(client, id) :: {:ok, Patient.t()} | error
  def patients_read(client, id), do: read(client, id, Patient)

  @doc "Updates existing patient resource by ID and params."
  @spec patients_update(client, id, Patient.upsert_params()) :: :ok | error
  def patients_update(client, id, params), do: update(client, id, params, Patient)

  @doc "Retrieve patient QRDA1."
  @spec patients_qrda1(client, integer(), Patient.list_params()) :: {:ok, String.t()} | error
  def patients_qrda1(client, id, params) do
    with {:ok, %Response{body: data}} <-
           Client.get(
             client,
             "/patients/#{id}/qrda1",
             [{"accept", "application/xml"}],
             params: params
           ),
         do: {:ok, data}
  end

  # --------------------------------------------------------------------
  # Offices
  # --------------------------------------------------------------------

  @doc "Add an exam room to the office."
  @spec offices_add_exam_room(client, integer(), ExamRoom.upsert_params()) ::
          {:ok, Office.t()} | error
  def offices_add_exam_room(client, id, params) do
    with {:ok, %Response{body: data}} <-
           Client.post(
             client,
             "/offices/#{id}/add_exam_room",
             params,
             upsert_headers()
           ),
         do: {:ok, cast_resource(Office, data)}
  end

  @doc "Fetches all office resources."
  @spec offices_list(client, Office.list_params() | %{}) ::
          {:ok, %{data: [Office.t()] | [], next: next, previous: previous}} | error
  def offices_list(client, params \\ %{}), do: list(client, Office, params)

  @doc "Partially updates existing office resource by ID and params."
  @spec offices_partial_update(client, id, Office.partial_update_params()) :: :ok | error
  def offices_partial_update(client, id, params), do: partial_update(client, id, params, Office)

  @doc "Fetches office resource by ID."
  @spec offices_read(client, id) :: {:ok, Office.t()} | error
  def offices_read(client, id), do: read(client, id, Office)
end
