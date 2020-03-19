defmodule Chroner.Administrative.UserGroup do
  use Ecto.Schema

  @primary_key false
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

  embedded_schema do
    field :archived, :boolean
    field :created_at, :string
    field :id, :integer
    field :members, {:array, :string}
    field :name, :string
    field :practice_group, :string
    field :updated_at, :string
  end

  def plural, do: "user_groups"
end
