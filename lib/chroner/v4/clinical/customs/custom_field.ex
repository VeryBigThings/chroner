defmodule Chroner.V4.Clinical.Customs.CustomField do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema"

  use Chroner.Schema

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          field_type: integer(),
          field_value: String.t(),
          updated_at: DateTime.t()
        }

  embedded_schema do
    field :created_at, :naive_datetime
    field :field_type, :integer
    field :field_value, :string
    field :updated_at, :naive_datetime
  end
end
