defmodule Chroner do
  @moduledoc """
  Client implementation for Dr.Chrono according to https://app.drchrono.com/api-docs reference.
  """
  alias Chroner.{Administrative, Authorization, Clinical}

  # --------------------------------------------------------------------
  # Authentication
  # --------------------------------------------------------------------

  defdelegate client(access_token), to: Authorization

  # --------------------------------------------------------------------
  # Administrative
  # --------------------------------------------------------------------

  defdelegate doctors_list(client), to: Administrative
  defdelegate doctors_read(client, id), to: Administrative
  defdelegate users_current(client), to: Administrative
  defdelegate users_list(client), to: Administrative
  defdelegate users_read(client, id), to: Administrative
  defdelegate user_groups_read(client, id), to: Administrative

  # --------------------------------------------------------------------
  # Clinical
  # --------------------------------------------------------------------

  defdelegate appointment_profiles_list(client), to: Clinical
  defdelegate appointment_profiles_create(client, params), to: Clinical
  defdelegate appointment_profiles_delete(client, id), to: Clinical
  defdelegate appointment_profiles_partial_update(client, id, params), to: Clinical
  defdelegate appointment_profiles_read(client, id), to: Clinical
  defdelegate appointment_profiles_update(client, id, params), to: Clinical

  defdelegate patients_list(client), to: Clinical
  defdelegate patients_create(client, params), to: Clinical
  defdelegate patients_delete(client, id), to: Clinical
  defdelegate patients_read(client, id), to: Clinical
  defdelegate patients_update(client, id, params), to: Clinical

  # --------------------------------------------------------------------
  # Billing
  # --------------------------------------------------------------------

  # --------------------------------------------------------------------
  # Practice Management
  # --------------------------------------------------------------------
end
