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

  @doc "Fetches all doctors resources."
  @spec doctors_list(client) :: {:ok, [Doctor.t()] | []} | error
  def doctors_list(client), do: list(client, Doctor)

  @doc "Fetches doctors resource by ID."
  @spec doctors_read(client, id) :: {:ok, Doctor.t()} | error
  def doctors_read(client, id), do: read(client, id, Doctor)

  # --------------------------------------------------------------------
  # Users
  # --------------------------------------------------------------------

  @doc "Fetches users resource by ID."
  @spec users_current(client) :: {:ok, User.t()} | error
  def users_current(client), do: current(client, User)

  @doc "Fetches all users resources."
  @spec users_list(client) :: {:ok, [User.t()] | []} | error
  def users_list(client), do: list(client, User)

  @doc "Fetches users resource by ID."
  @spec users_read(client, id) :: {:ok, User.t()} | error
  def users_read(client, id), do: read(client, id, User)

  # --------------------------------------------------------------------
  # User Groups
  # --------------------------------------------------------------------

  @doc "Fetches all user groups resources."
  @spec user_groups_list(client) :: {:ok, [UserGroup.t()] | []} | error
  def user_groups_list(client), do: list(client, UserGroup)

  @doc "Fetches user groups resource by ID."
  @spec user_groups_read(client, id) ::
          {:ok, UserGroup.t()} | error
  def user_groups_read(client, id), do: read(client, id, UserGroup)
end
