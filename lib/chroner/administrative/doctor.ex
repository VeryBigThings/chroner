defmodule Chroner.Administrative.Doctor do
  @derive [Poison.Encoder]

  @type t :: %__MODULE__{
          cell_phone: String.t(),
          country: String.t(),
          email: String.t(),
          first_name: String.t(),
          group_npi_number: String.t(),
          home_phone: String.t(),
          id: integer(),
          is_account_suspended: boolean(),
          job_title: String.t(),
          last_name: String.t(),
          npi_number: String.t(),
          office_phone: String.t(),
          practice_group_name: String.t(),
          practice_group: String.t(),
          profile_picture: String.t(),
          specialty: String.t(),
          suffix: String.t(),
          timezone: String.t(),
          website: String.t()
        }

  defstruct [
    :cell_phone,
    :country,
    :email,
    :first_name,
    :group_npi_number,
    :home_phone,
    :id,
    :is_account_suspended,
    :job_title,
    :last_name,
    :npi_number,
    :office_phone,
    :practice_group_name,
    :practice_group,
    :profile_picture,
    :specialty,
    :suffix,
    :timezone,
    :website
  ]

  def plural, do: "doctors"
end
