defmodule Chroner.V4.Clinical.Customs.CustomField do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema"

  use Chroner.Schema

  @type t :: %__MODULE__{
          created_at: String.t(),
          field_type: integer(),
          field_value: String.t(),
          updated_at: String.t()
        }

  embedded_schema do
    field :created_at, :string
    field :field_type, :integer
    field :field_value, :string
    field :updated_at, :string
  end
end
