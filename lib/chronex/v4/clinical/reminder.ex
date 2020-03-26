defmodule Chronex.V4.Clinical.Reminder do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema"

  use Chronex.Schema

  @type t :: %__MODULE__{
          id: integer(),
          scheduled_time: DateTime.t(),
          type: :email | :sms | :auto_call
        }

  embedded_schema do
    field :id, :integer
    field :scheduled_time, :naive_datetime
    field :type, :string
  end
end
