defmodule Chroner.V4.Clinical.Vitals do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema"

  use Chroner.Schema

  @type head_circumference_units :: :inches | :cm
  @type height_units :: :inches | :cm

  @type t :: %__MODULE__{
          blood_pressure_1: integer(),
          blood_pressure_2: integer(),
          head_circumference_units: head_circumference_units(),
          head_circumference: String.t(),
          height_units: height_units(),
          height: float(),
          oxygen_saturation: float(),
          pain: String.t(),
          pulse: integer(),
          respiratory_rate: integer(),
          smoking_status: String.t(),
          temperature_units: temperature_units(),
          temperature: float(),
          weight_units: weight_units(),
          weight: float()
        }

  @type temperature_units :: :f | :c

  @type upsert_params :: %{
          optional(:blood_pressure_1) => integer(),
          optional(:blood_pressure_2) => integer(),
          optional(:head_circumference_units) => head_circumference_units(),
          optional(:head_circumference) => String.t(),
          optional(:height_units) => height_units(),
          optional(:height) => float(),
          optional(:oxygen_saturation) => float(),
          optional(:pain) => String.t(),
          optional(:pulse) => integer(),
          optional(:respiratory_rate) => integer(),
          optional(:smoking_status) => String.t(),
          optional(:temperature_units) => temperature_units(),
          optional(:temperature) => float(),
          optional(:weight_units) => weight_units(),
          optional(:weight) => float()
        }

  @type weight_units :: :lbs | :kg

  embedded_schema do
    field :blood_pressure_1, :integer
    field :blood_pressure_2, :integer
    field :bmi, :float
    field :head_circumference_units, :string
    field :head_circumference, :string
    field :height_units, :string
    field :height, :float
    field :oxygen_saturation, :float
    field :pain, :string
    field :pulse, :integer
    field :respiratory_rate, :integer
    field :smoking_status, :string
    field :temperature_units, :string
    field :temperature, :float
    field :weight_units, :string
    field :weight, :float
  end
end
