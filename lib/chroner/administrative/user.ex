defmodule Chroner.Administrative.User do
  @moduledoc "User"

  use Ecto.Schema

  @primary_key false
  @derive [Poison.Encoder]

  alias Chroner.Administrative.Permissions

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
