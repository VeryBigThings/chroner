defmodule Chroner.V4.Clinical.Office.OnlineTimeslot do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema and https://rdecicca.drchrono.com/api-docs-old/v4/documentation#apioffices"

  use Chroner.Schema

  @type t :: %__MODULE__{
          day: 0..6,
          hour: 0..24,
          minute: 0 | 15 | 30 | 45
        }

  embedded_schema do
    field :day, :integer
    field :hour, :integer
    field :minute, :integer
  end
end
