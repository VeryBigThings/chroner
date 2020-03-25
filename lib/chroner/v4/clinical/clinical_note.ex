defmodule Chroner.V4.Clinical.ClinicalNote do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema"

  use Chroner.Schema

  @type t :: %__MODULE__{
          locked: boolean(),
          pdf: String.t(),
          updated_at: String.t()
        }

  embedded_schema do
    field :locked, :boolean
    field :pdf, :string
    field :updated_at, :string
  end
end
