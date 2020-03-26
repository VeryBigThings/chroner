defmodule Chronex.V4.Clinical.PatientFlagAttached do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema"

  use Chronex.Schema

  @type upsert_params :: %{
          optional(:flag_text) => String.t(),
          required(:flag_type) => integer()
        }

  @type t :: %__MODULE__{
          flag_text: String.t(),
          flag_type: integer()
        }

  embedded_schema do
    field :flag_text, :string
    field :flag_type, :integer
  end
end
