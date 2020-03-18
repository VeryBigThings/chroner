defmodule Chroner.Clinical.AppointmentProfile do
  @derive [Poison.Encoder]

  @type create_params :: %{
          required(:color) => String.t(),
          optional(:doctor) => integer(),
          optional(:duration) => integer(),
          required(:name) => String.t(),
          optional(:reason) => String.t(),
          required(:online_scheduling) => boolean(),
          optional(:duration) => integer()
        }

  @type partial_update_params :: %{
          optional(:color) => String.t(),
          optional(:doctor) => integer(),
          optional(:duration) => integer(),
          optional(:name) => String.t(),
          optional(:reason) => String.t(),
          optional(:online_scheduling) => boolean(),
          optional(:duration) => integer()
        }

  @type update_params :: %{
          optional(:color) => String.t(),
          optional(:doctor) => integer(),
          optional(:duration) => integer(),
          optional(:name) => String.t(),
          optional(:reason) => String.t(),
          optional(:online_scheduling) => boolean(),
          optional(:duration) => integer()
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
