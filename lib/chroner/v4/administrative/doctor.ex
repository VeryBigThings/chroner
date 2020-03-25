defmodule Chroner.V4.Administrative.Doctor do
  @moduledoc "Doctor"

  use Chroner.V4.Schema

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
          practice_group: integer(),
          profile_picture: String.t(),
          specialty: String.t(),
          suffix: String.t(),
          timezone: String.t(),
          website: String.t()
        }

  embedded_schema do
    field :cell_phone, :string
    field :country, :string
    field :email, :string
    field :first_name, :string
    field :group_npi_number, :string
    field :home_phone, :string
    field :id, :integer
    field :is_account_suspended, :boolean
    field :job_title, :string
    field :last_name, :string
    field :npi_number, :string
    field :office_phone, :string
    field :practice_group_name, :string
    field :practice_group, :integer
    field :profile_picture, :string
    field :specialty, :string
    field :suffix, :string
    field :timezone, :string
    field :website, :string
  end

  def plural, do: "doctors"
end
