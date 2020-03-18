defmodule Chroner.Clinical do
  @moduledoc """
  Create and manage clinical resources.
  """

  alias __MODULE__.{AppointmentProfile, Patient}

  use Chroner.CRUD,
    import: [
      appointment_profiles:
        {AppointmentProfile, [:create, :delete, :list, :partial_update, :read, :update]},
      patients: {Patient, [:create, :delete, :list, :read, :update]}
    ]
end
