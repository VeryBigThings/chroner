defmodule Chroner.Administrative do
  @moduledoc """
  Create and manage administrative resources.
  """

  import Chroner.Resource

  alias __MODULE__.{Doctor, User, UserGroup}

  @type id :: id
  @type client :: OAuth2.Client.t()
  @type error :: {:error, OAuth2.Response.t()}

  # --------------------------------------------------------------------
  # Doctors
  # --------------------------------------------------------------------

  @spec doctors_list(client) :: {:ok, Doctor.t()} | error
  @doc "Fetches all doctors resources."
  def doctors_list(client), do: list(client, Doctor)

  @spec doctors_read(client, id) :: {:ok, Doctor.t()} | error
  @doc "Fetches doctors resource by ID."
  def doctors_read(client, id), do: read(client, id, Doctor)

  # --------------------------------------------------------------------
  # Users
  # --------------------------------------------------------------------

  @spec users_current(client) :: {:ok, User.t()} | error
  @doc "Fetches users resource by ID."
  def users_current(client), do: current(client, User)

  @spec users_list(client) :: {:ok, User.t()} | error
  @doc "Fetches all users resources."
  def users_list(client), do: list(client, User)

  @spec users_read(client, id) :: {:ok, User.t()} | error
  @doc "Fetches users resource by ID."
  def users_read(client, id), do: read(client, id, User)

  # --------------------------------------------------------------------
  # User Groups
  # --------------------------------------------------------------------

  @spec user_groups_read(client, id) ::
          {:ok, UserGroup.t()} | error
  @doc "Fetches user groups resource by ID."
  def user_groups_read(client, id), do: read(client, id, UserGroup)
end
