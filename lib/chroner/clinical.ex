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

  @doc "Creates new appointment_profiles resource."
  @spec appointment_profiles_create(client, AppointmentProfile.create_params()) ::
          {:ok, AppointmentProfile.t()} | error
  def appointment_profiles_create(client, params), do: create(client, params, AppointmentProfile)

  @doc "Deletes appointment_profiles resource by ID."
  @spec appointment_profiles_delete(client, id) ::
          :ok | error
  def appointment_profiles_delete(client, id), do: delete(client, id, AppointmentProfile)

  @doc "Fetches all appointment_profiles resources."
  @spec appointment_profiles_list(client) ::
          {:ok, AppointmentProfile.t()} | error
  def appointment_profiles_list(client), do: list(client, AppointmentProfile)

  @doc "Partially updates existing appointment_profiles resource by ID and params."
  @spec appointment_profiles_partial_update(
          client,
          id,
          AppointmentProfile.partial_update_params()
        ) ::
          {:ok, AppointmentProfile.t()} | error
  def appointment_profiles_partial_update(client, id, params),
    do: partial_update(client, id, params, AppointmentProfile)

  @doc "Fetches appointment_profiles resource by ID."
  @spec appointment_profiles_read(client, id) ::
          {:ok, AppointmentProfile.t()} | error
  def appointment_profiles_read(client, id), do: read(client, id, AppointmentProfile)

  @doc "Updates existing appointment_profiles resource by ID and params."
  @spec appointment_profiles_update(client, id, AppointmentProfile.update_params()) ::
          {:ok, AppointmentProfile.t()} | error
  def appointment_profiles_update(client, id, params),
    do: update(client, id, params, AppointmentProfile)

  # --------------------------------------------------------------------
  # Patients
  # --------------------------------------------------------------------

  @doc "Creates new patients resource."
  @spec patients_create(client, Patient.create_params()) ::
          {:ok, Patient.t()} | error
  def patients_create(client, params), do: create(client, params, Patient)

  @doc "Deletes patients resource by ID."
  @spec patients_delete(client, id) ::
          :ok | error
  def patients_delete(client, id), do: delete(client, id, Patient)
  @doc "Fetches all patients resources."

  @spec patients_list(client) :: {:ok, Patient.t()} | error
  def patients_list(client), do: list(client, Patient)
  @doc "Fetches patients resource by ID."

  @spec patients_read(client, id) :: {:ok, Patient.t()} | error
  def patients_read(client, id), do: read(client, id, Patient)

  @doc "Updates existing patients resource by ID and params."
  @spec patients_update(client, id, Patient.update_params()) ::
          {:ok, Patient.t()} | error
  def patients_update(client, id, params), do: update(client, id, params, Patient)
end
