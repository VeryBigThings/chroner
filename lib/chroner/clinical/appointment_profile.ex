defmodule Chroner.Clinical.AppointmentProfile do
  @derive [Poison.Encoder]

  @type create_params :: %{
          doctor: integer()
        }

  @type partial_update_params :: %{
          optional(:doctor) => integer()
        }

  @type update_params :: %{
          optional(:doctor) => integer()
        }

  @type t :: %__MODULE__{
          archived: boolean(),
          color: String.t(),
          doctor: integer(),
          duration: integer(),
          id: integer(),
          name: String.t(),
          online_scheduling: boolean(),
          reason: String.t(),
          sort_order: integer()
        }

  defstruct [
    :archived,
    :color,
    :doctor,
    :duration,
    :id,
    :name,
    :online_scheduling,
    :reason,
    :sort_order
  ]
end
