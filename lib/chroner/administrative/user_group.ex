defmodule Chroner.Administrative.UserGroup do
  @derive [Poison.Encoder]

  @type t :: %__MODULE__{
          archived: boolean(),
          created_at: String.t(),
          id: integer(),
          members: list(String.t()),
          name: String.t(),
          practice_group: String.t(),
          updated_at: String.t()
        }

  defstruct [
    :archived,
    :created_at,
    :id,
    :members,
    :name,
    :practice_group,
    :updated_at
  ]

  def plural, do: "user_groups"
end
