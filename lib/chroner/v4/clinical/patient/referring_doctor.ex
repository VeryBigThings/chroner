defmodule Chroner.V4.Clinical.Patient.ReferringDoctor do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema"

  use Chroner.Schema

  alias Chroner.V4.Administrative.Doctor

  @type provider_qualifier :: :"" | :"0B" | :"1G" | :G2

  @type upsert_params :: %{
          optional(:address) => String.t(),
          optional(:email) => String.t(),
          optional(:fax) => String.t(),
          optional(:first_name) => String.t(),
          optional(:last_name) => String.t(),
          optional(:middle_name) => String.t(),
          optional(:npi) => String.t(),
          optional(:phone) => String.t(),
          optional(:provider_number) => String.t(),
          optional(:provider_qualifier) => provider_qualifier(),
          optional(:specialty) => Doctor.specialty(),
          optional(:suffix) => String.t()
        }

  @type t :: %__MODULE__{
          address: String.t(),
          email: String.t(),
          fax: String.t(),
          first_name: String.t(),
          last_name: String.t(),
          middle_name: String.t(),
          npi: String.t(),
          phone: String.t(),
          provider_number: String.t(),
          provider_qualifier: provider_qualifier(),
          specialty: Doctor.specialty(),
          suffix: String.t()
        }

  embedded_schema do
    field :address, :string
    field :email, :string
    field :fax, :string
    field :first_name, :string
    field :last_name, :string
    field :middle_name, :string
    field :npi, :string
    field :phone, :string
    field :provider_number, :string
    field :provider_qualifier, :string
    field :specialty, :string
    field :suffix, :string
  end
end
