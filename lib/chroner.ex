defmodule Chroner do
  @moduledoc """
  Client implementation for Dr.Chrono according to https://app.drchrono.com/api-docs reference.
  """

  @default_api_version "V4"

  # --------------------------------------------------------------------
  # Authorization
  # --------------------------------------------------------------------

  def client(config), do: apply(api_module(Authorization), :client, [config])

  def authorize_url!(client, scope),
    do: apply(api_module(Authorization), :client, [client, scope])

  def get_token!(client, params), do: apply(api_module(Authorization), :client, [client, params])

  # --------------------------------------------------------------------
  # Administrative
  # --------------------------------------------------------------------

  def doctors_list(client), do: apply(api_module(Authorization), :doctors_list, [client])
  def doctors_read(client, id), do: apply(api_module(Authorization), :doctors_read, [client, id])
  def users_current(client), do: apply(api_module(Authorization), :users_current, [client])
  def users_list(client), do: apply(api_module(Authorization), :users_list, [client])
  def users_read(client, id), do: apply(api_module(Authorization), :users_read, [client, id])
  def user_groups_list(client), do: apply(api_module(Authorization), :user_groups_list, [client])

  def user_groups_read(client, id),
    do: apply(api_module(Authorization), :user_groups_read, [client, id])

  # --------------------------------------------------------------------
  # Clinical
  # --------------------------------------------------------------------

  def appointment_profiles_list(client, filters),
    do: apply(api_module(Authorization), :appointment_profiles_list, [client, filters])

  def appointment_profiles_create(client, params),
    do: apply(api_module(Authorization), :appointment_profiles_create, [client, params])

  def appointment_profiles_delete(client, id),
    do: apply(api_module(Authorization), :appointment_profiles_delete, [client, id])

  def appointment_profiles_partial_update(client, id, params),
    do:
      apply(api_module(Authorization), :appointment_profiles_partial_update, [client, id, params])

  def appointment_profiles_read(client, id),
    do: apply(api_module(Authorization), :appointment_profiles_read, [client, id])

  def appointment_profiles_update(client, id, params),
    do: apply(api_module(Authorization), :appointment_profiles_update, [client, id, params])

  def patients_list(client, filters),
    do: apply(api_module(Authorization), :patients_list, [client, filters])

  def patients_create(client, params),
    do: apply(api_module(Authorization), :patients_create, [client, params])

  def patients_delete(client, id),
    do: apply(api_module(Authorization), :patients_delete, [client, id])

  def patients_read(client, id),
    do: apply(api_module(Authorization), :patients_read, [client, id])

  def patients_update(client, id, params),
    do: apply(api_module(Authorization), :patients_update, [client, id, params])

  # --------------------------------------------------------------------
  # Billing
  # --------------------------------------------------------------------

  # --------------------------------------------------------------------
  # Practice Management
  # --------------------------------------------------------------------

  defp api_module(module), do: Module.concat([Chroner, resolve_api_version(), module])

  defp resolve_api_version,
    do: Application.get_env(:chroner, :api_version) || @default_api_version
end
