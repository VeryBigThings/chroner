defmodule Chroner.V4.Administrative.User do
  @moduledoc "User"

  use Chroner.Schema

  alias Chroner.V4.Administrative.Permissions

  @type list_params :: %{
          optional(:cursor) => String.t(),
          optional(:doctor) => integer(),
          optional(:page_size) => integer()
        }

  @type t :: %__MODULE__{
          doctor: integer(),
          id: integer(),
          is_doctor: String.t(),
          is_staff: String.t(),
          permissions: Permissions.t(),
          practice_group: integer(),
          username: String.t()
        }

  embedded_schema do
    field :doctor, :integer
    field :id, :integer
    field :is_doctor, :boolean
    field :is_staff, :boolean
    embeds_one :permissions, Permissions
    field :practice_group, :integer
    field :username, :string
  end

  def plural, do: "users"
end
