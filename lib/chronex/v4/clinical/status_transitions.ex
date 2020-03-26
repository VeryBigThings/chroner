defmodule Chronex.V4.Clinical.StatusTransition do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema"

  use Chronex.Schema

  @type t :: %__MODULE__{
          appointment: integer(),
          datetime: DateTime.t(),
          from_status: String.t(),
          to_status: String.t()
        }

  embedded_schema do
    field :appointment, :integer
    field :datetime, :naive_datetime
    field :from_status, :string
    field :to_status, :string
  end
end
