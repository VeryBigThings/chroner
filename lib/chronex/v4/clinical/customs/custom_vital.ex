defmodule Chronex.V4.Clinical.Customs.CustomVital do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema"

  use Chronex.Schema

  @type upsert_params :: %{
          required(:value) => String.t(),
          required(:vital_type) => integer()
        }

  @type t :: %__MODULE__{
          value: String.t(),
          vital_type: integer()
        }

  embedded_schema do
    field :value, :string
    field :vital_type, :integer
  end
end
