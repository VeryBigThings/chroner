defmodule Chronex.V4.Clinical.Office.ExamRoom do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema and https://rdecicca.drchrono.com/api-docs-old/v4/documentation#apioffices"

  use Chronex.Schema

  @type upsert_params :: %{
          required(:name) => String.t(),
          optional(:online_scheduling) => boolean()
        }

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
