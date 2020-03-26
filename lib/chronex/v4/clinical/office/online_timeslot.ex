defmodule Chronex.V4.Clinical.Office.OnlineTimeslot do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema and https://rdecicca.drchrono.com/api-docs-old/v4/documentation#apioffices"

  use Chronex.Schema

  @type day :: 0..6
  @type hour :: 0..24
  @type minute :: 0 | 15 | 30 | 45

  @type t :: %__MODULE__{
          day: day(),
          hour: hour(),
          minute: minute()
        }

  @type upsert_params :: %{
          required(:day) => day(),
          required(:hour) => hour(),
          required(:minute) => minute()
        }

  embedded_schema do
    field :day, :integer
    field :hour, :integer
    field :minute, :integer
  end
end
