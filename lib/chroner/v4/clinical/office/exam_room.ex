defmodule Chroner.V4.Clinical.Office.ExamRoom do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema and https://rdecicca.drchrono.com/api-docs-old/v4/documentation#apioffices"

  use Chroner.Schema

  @type t :: %__MODULE__{
          index: integer(),
          name: String.t(),
          online_scheduling: boolean()
        }

  embedded_schema do
    field :index, :integer
    field :name, :string
    field :online_scheduling, :boolean
  end
end
