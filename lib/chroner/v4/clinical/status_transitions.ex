defmodule Chroner.V4.Clinical.StatusTransitions do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema"

  use Chroner.Schema

  @type t :: %__MODULE__{
          appointment: integer(),
          datetime: String.t(),
          from_status: String.t(),
          to_status: String.t()
        }

  embedded_schema do
    field :appointment, :integer
    field :datetime, :string
    field :from_status, :string
    field :to_status, :string
  end
end
