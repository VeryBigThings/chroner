defmodule Chroner.V4.Clinical.AppointmentProfile do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema and https://rdecicca.drchrono.com/api-docs-old/v4/documentation#apiappointment_profiles"

  use Chroner.Schema

  @type filter_params :: %{
          optional(:doctor) => integer(),
          optional(:show_archived) => boolean()
        }

  @type upsert_params :: %{
          optional(:archived) => boolean(),
          required(:color) => String.t(),
          optional(:doctor) => integer(),
          optional(:duration) => integer(),
          required(:name) => String.t(),
          optional(:reason) => String.t(),
          required(:online_scheduling) => boolean(),
          optional(:sort_order) => integer()
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

  embedded_schema do
    field :archived, :boolean
    field :color, :string
    field :doctor, :integer
    field :duration, :integer
    field :id, :integer
    field :name, :string
    field :online_scheduling, :boolean
    field :reason, :string
    field :sort_order, :integer
  end

  def plural, do: "appointment_profiles"
end
