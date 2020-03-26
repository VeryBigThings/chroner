defmodule Chroner.V4.Clinical.Customs.CustomDemographic do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema"

  use Chroner.Schema

  @type upsert_params :: %{
          required(:field_type) => integer(),
          required(:value) => String.t()
        }

  @type t :: %__MODULE__{
          field_type: integer(),
          updated_at: DateTime.t(),
          value: String.t()
        }

  embedded_schema do
    field :field_type, :integer
    field :updated_at, :naive_datetime
    field :value, :string
  end
end
