defmodule Chroner.V4.Clinical.BillingNote do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema"

  use Chroner.Schema

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          created_by: integer(),
          text: String.t()
        }

  embedded_schema do
    field :created_at, :naive_datetime
    field :created_by, :integer
    field :text, :string
  end
end
