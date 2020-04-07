defmodule Chronex do
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

  def doctors_list(client), do: apply(api_module(Administrative), :doctors_list, [client])
  def doctors_read(client, id), do: apply(api_module(Administrative), :doctors_read, [client, id])
  def users_current(client), do: apply(api_module(Administrative), :users_current, [client])
  def users_list(client), do: apply(api_module(Administrative), :users_list, [client])
  def users_read(client, id), do: apply(api_module(Administrative), :users_read, [client, id])
  def user_groups_list(client), do: apply(api_module(Administrative), :user_groups_list, [client])

  def user_groups_read(client, id),
    do: apply(api_module(Administrative), :user_groups_read, [client, id])

  # --------------------------------------------------------------------
  # Clinical
  # --------------------------------------------------------------------

  def appointments_list(client, filters \\ %{}),
    do: apply(api_module(Clinical), :appointments_list, [client, filters])

  def appointments_create(client, params),
    do: apply(api_module(Clinical), :appointments_create, [client, params])

  def appointments_delete(client, id),
    do: apply(api_module(Clinical), :appointments_delete, [client, id])

  def appointments_partial_update(client, id, params),
    do: apply(api_module(Clinical), :appointments_partial_update, [client, id, params])

  def appointments_read(client, id),
    do: apply(api_module(Clinical), :appointments_read, [client, id])

  def appointment_profiles_list(client, filters \\ %{}),
    do: apply(api_module(Clinical), :appointment_profiles_list, [client, filters])

  def appointment_profiles_create(client, params),
    do: apply(api_module(Clinical), :appointment_profiles_create, [client, params])

  def appointment_profiles_delete(client, id),
    do: apply(api_module(Clinical), :appointment_profiles_delete, [client, id])

  def appointment_profiles_partial_update(client, id, params),
    do: apply(api_module(Clinical), :appointment_profiles_partial_update, [client, id, params])

  def appointment_profiles_read(client, id),
    do: apply(api_module(Clinical), :appointment_profiles_read, [client, id])

  def appointment_profiles_update(client, id, params),
    do: apply(api_module(Clinical), :appointment_profiles_update, [client, id, params])

  def offices_add_exam_room(client, id, params),
    do: apply(api_module(Clinical), :offices_add_exam_room, [client, id, params])

  def offices_list(client, filters \\ %{}),
    do: apply(api_module(Clinical), :offices_list, [client, filters])

  def offices_read(client, id),
    do: apply(api_module(Clinical), :offices_read, [client, id])

  def offices_update(client, id, params),
    do: apply(api_module(Clinical), :offices_update, [client, id, params])

  def patients_list(client, filters \\ %{}),
    do: apply(api_module(Clinical), :patients_list, [client, filters])

  def patients_create(client, params),
    do: apply(api_module(Clinical), :patients_create, [client, params])

  def patients_delete(client, id),
    do: apply(api_module(Clinical), :patients_delete, [client, id])

  def patients_read(client, id),
    do: apply(api_module(Clinical), :patients_read, [client, id])

  def patients_update(client, id, params),
    do: apply(api_module(Clinical), :patients_update, [client, id, params])

  # --------------------------------------------------------------------
  # Billing
  # --------------------------------------------------------------------

  # --------------------------------------------------------------------
  # Practice Management
  # --------------------------------------------------------------------

  defp api_module(module), do: Module.concat([Chronex, resolve_api_version(), module])

  defp resolve_api_version,
    do: Application.get_env(:chronex, :api_version) || @default_api_version
end
