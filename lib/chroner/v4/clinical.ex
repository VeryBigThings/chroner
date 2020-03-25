defmodule Chroner.V4.Clinical do
  @moduledoc """
  Create and manage clinical resources.
  """

  import Chroner.V4.Resource

  alias __MODULE__.{Appointment, AppointmentProfile, Patient}

  @type id :: integer()
  @type client :: OAuth2.Client.t()
  @type error :: {:error, OAuth2.Response.t()}

  # --------------------------------------------------------------------
  # Appointments
  # --------------------------------------------------------------------

  @doc "Creates new appointments resource."
  @spec appointments_create(client, Appointment.upsert_params()) ::
          {:ok, Appointment.t()} | error
  def appointments_create(client, params), do: create(client, params, Appointment)

  @doc "Deletes appointments resource by ID."
  @spec appointments_delete(client, id) ::
          :ok | error
  def appointments_delete(client, id), do: delete(client, id, Appointment)

  @doc "Fetches all appointments resources."
  @spec appointments_list(client, Appointment.filter_params() | %{}) ::
          {:ok, [Appointment.t()] | []} | error
  def appointments_list(client, filters \\ %{}), do: list(client, Appointment, filters)

  @doc "Partialky updates existing appointments resource by ID and params."
  @spec appointments_partial_update(client, id, Appointment.upsert_params()) :: :ok | error
  def appointments_partial_update(client, id, params),
    do: partial_update(client, id, params, Appointment)

  @doc "Fetches appointments resource by ID."
  @spec appointments_read(client, id) :: {:ok, Appointment.t()} | error
  def appointments_read(client, id), do: read(client, id, Appointment)

  @doc "Updates existing appointments resource by ID and params."
  @spec appointments_update(client, id, Appointment.upsert_params()) :: :ok | error
  def appointments_update(client, id, params), do: update(client, id, params, Appointment)

  # --------------------------------------------------------------------
  # Appointment Profiles
  # --------------------------------------------------------------------

  @doc "Creates new appointment_profiles resource."
  @spec appointment_profiles_create(client, AppointmentProfile.upsert_params()) ::
          {:ok, AppointmentProfile.t()} | error
  def appointment_profiles_create(client, params), do: create(client, params, AppointmentProfile)

  @doc "Deletes appointment_profiles resource by ID."
  @spec appointment_profiles_delete(client, id) ::
          :ok | error
  def appointment_profiles_delete(client, id), do: delete(client, id, AppointmentProfile)

  @doc "Fetches all appointment_profiles resources."
  @spec appointment_profiles_list(client, AppointmentProfile.filter_params() | %{}) ::
          {:ok, [AppointmentProfile.t()] | []} | error
  def appointment_profiles_list(client, filters \\ %{}),
    do: list(client, AppointmentProfile, filters)

  @doc "Partially updates existing appointment_profiles resource by ID and params."
  @spec appointment_profiles_partial_update(
          client,
          id,
          AppointmentProfile.upsert_params()
        ) ::
          {:ok, AppointmentProfile.t()} | error
  def appointment_profiles_partial_update(client, id, params),
    do: partial_update(client, id, params, AppointmentProfile)

  @doc "Fetches appointment_profiles resource by ID."
  @spec appointment_profiles_read(client, id) ::
          {:ok, AppointmentProfile.t()} | error
  def appointment_profiles_read(client, id), do: read(client, id, AppointmentProfile)

  @doc "Updates existing appointment_profiles resource by ID and params."
  @spec appointment_profiles_update(client, id, AppointmentProfile.upsert_params()) ::
          {:ok, AppointmentProfile.t()} | error
  def appointment_profiles_update(client, id, params),
    do: update(client, id, params, AppointmentProfile)

  # --------------------------------------------------------------------
  # Patients
  # --------------------------------------------------------------------

  @doc "Creates new patients resource."
  @spec patients_create(client, Patient.upsert_params()) ::
          {:ok, Patient.t()} | error
  def patients_create(client, params), do: create(client, params, Patient)

  @doc "Deletes patients resource by ID."
  @spec patients_delete(client, id) ::
          :ok | error
  def patients_delete(client, id), do: delete(client, id, Patient)

  @doc "Fetches all patients resources."
  @spec patients_list(client, Patient.filter_params() | %{}) :: {:ok, [Patient.t()] | []} | error
  def patients_list(client, filters \\ %{}), do: list(client, Patient, filters)

  @doc "Fetches patients resource by ID."
  @spec patients_read(client, id) :: {:ok, Patient.t()} | error
  def patients_read(client, id), do: read(client, id, Patient)

  @doc "Updates existing patients resource by ID and params."
  @spec patients_update(client, id, Patient.upsert_params()) :: :ok | error
  def patients_update(client, id, params), do: update(client, id, params, Patient)
end
