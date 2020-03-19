defmodule Chroner.Clinical do
  @moduledoc """
  Create and manage clinical resources.
  """

  import Chroner.Resource

  alias __MODULE__.{AppointmentProfile, Patient}

  @type id :: integer()
  @type client :: OAuth2.Client.t()
  @type error :: {:error, OAuth2.Response.t()}

  # --------------------------------------------------------------------
  # Appointment Profiles
  # --------------------------------------------------------------------

  @spec appointment_profiles_create(client, AppointmentProfile.create_params()) ::
          {:ok, AppointmentProfile.t()} | error
  @doc "Creates new appointment_profiles resource."
  def appointment_profiles_create(client, params), do: create(client, params, AppointmentProfile)

  @spec appointment_profiles_delete(client, id) ::
          :ok | error
  @doc "Deletes appointment_profiles resource by ID."
  def appointment_profiles_delete(client, id), do: delete(client, id, AppointmentProfile)

  @spec appointment_profiles_list(client) ::
          {:ok, AppointmentProfile.t()} | error
  @doc "Fetches all appointment_profiles resources."
  def appointment_profiles_list(client), do: list(client, AppointmentProfile)

  @spec appointment_profiles_partial_update(
          client,
          id,
          AppointmentProfile.partial_update_params()
        ) ::
          {:ok, AppointmentProfile.t()} | error
  @doc "Partially updates existing appointment_profiles resource by ID and params."
  def appointment_profiles_partial_update(client, id, params),
    do: partial_update(client, id, params, AppointmentProfile)

  @spec appointment_profiles_read(client, id) ::
          {:ok, AppointmentProfile.t()} | error
  @doc "Fetches appointment_profiles resource by ID."
  def appointment_profiles_read(client, id), do: read(client, id, AppointmentProfile)

  @spec appointment_profiles_update(client, id, AppointmentProfile.update_params()) ::
          {:ok, AppointmentProfile.t()} | error
  @doc "Updates existing appointment_profiles resource by ID and params."
  def appointment_profiles_update(client, id, params),
    do: update(client, id, params, AppointmentProfile)

  # --------------------------------------------------------------------
  # Patients
  # --------------------------------------------------------------------

  @spec patients_create(client, Patient.create_params()) ::
          {:ok, Patient.t()} | error
  @doc "Creates new patients resource."
  def patients_create(client, params), do: create(client, params, Patient)

  @spec patients_delete(client, id) ::
          :ok | error
  @doc "Deletes patients resource by ID."
  def patients_delete(client, id), do: delete(client, id, Patient)

  @spec patients_list(client) :: {:ok, Patient.t()} | error
  @doc "Fetches all patients resources."
  def patients_list(client), do: list(client, Patient)

  @spec patients_read(client, id) :: {:ok, Patient.t()} | error
  @doc "Fetches patients resource by ID."
  def patients_read(client, id), do: read(client, id, Patient)

  @spec patients_update(client, id, Patient.update_params()) ::
          {:ok, Patient.t()} | error
  @doc "Updates existing patients resource by ID and params."
  def patients_update(client, id, params), do: update(client, id, params, Patient)
end
