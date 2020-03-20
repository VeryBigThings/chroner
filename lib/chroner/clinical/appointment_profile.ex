defmodule Chroner.Clinical.AppointmentProfile do
  @moduledoc "Appointment profile"

  use Ecto.Schema

  @primary_key false
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
          required(:color) => String.t(),
          required(:doctor) => integer(),
          required(:duration) => integer(),
          required(:name) => String.t(),
          required(:reason) => String.t(),
          required(:online_scheduling) => boolean(),
          required(:duration) => integer()
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

  def plural, do: "appointment_profile"
end
