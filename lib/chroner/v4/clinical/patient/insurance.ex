defmodule Chroner.V4.Clinical.Patient.Insurance do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema"

  use Chroner.Schema

  @type gender :: :"" | :Male | :Female | :Other | :UNK | :ASKU

  @type upsert_params :: %{
          optional(:insurance_claim_office_number) => String.t(),
          optional(:insurance_company) => String.t(),
          optional(:insurance_group_name) => String.t(),
          optional(:insurance_group_number) => String.t(),
          optional(:insurance_id_number) => String.t(),
          optional(:insurance_payer_id) => String.t(),
          optional(:insurance_plan_name) => String.t(),
          optional(:insurance_plan_type) => String.t(),
          optional(:is_subscriber_the_patient) => boolean(),
          optional(:patient_relationship_to_subscriber) => String.t(),
          optional(:photo_back) => String.t(),
          optional(:photo_front) => String.t(),
          optional(:subscriber_address) => String.t(),
          optional(:subscriber_city) => String.t(),
          optional(:subscriber_country) => String.t(),
          optional(:subscriber_date_of_birth) => String.t(),
          optional(:subscriber_first_name) => String.t(),
          optional(:subscriber_gender) => gender(),
          optional(:subscriber_last_name) => String.t(),
          optional(:subscriber_middle_name) => String.t(),
          optional(:subscriber_social_security) => String.t(),
          optional(:subscriber_state) => String.t(),
          optional(:subscriber_suffix) => String.t(),
          optional(:subscriber_zip_code) => String.t()
        }

  @type t :: %__MODULE__{
          insurance_claim_office_number: String.t(),
          insurance_company: String.t(),
          insurance_group_name: String.t(),
          insurance_group_number: String.t(),
          insurance_id_number: String.t(),
          insurance_payer_id: String.t(),
          insurance_plan_name: String.t(),
          insurance_plan_type: String.t(),
          is_subscriber_the_patient: boolean(),
          patient_relationship_to_subscriber: String.t(),
          photo_back: String.t(),
          photo_front: String.t(),
          subscriber_address: String.t(),
          subscriber_city: String.t(),
          subscriber_country: String.t(),
          subscriber_date_of_birth: DateTime.t(),
          subscriber_first_name: String.t(),
          subscriber_gender: gender(),
          subscriber_last_name: String.t(),
          subscriber_middle_name: String.t(),
          subscriber_social_security: String.t(),
          subscriber_state: String.t(),
          subscriber_suffix: String.t(),
          subscriber_zip_code: String.t()
        }

  embedded_schema do
    field :insurance_claim_office_number, :string
    field :insurance_company, :string
    field :insurance_group_name, :string
    field :insurance_group_number, :string
    field :insurance_id_number, :string
    field :insurance_payer_id, :string
    field :insurance_plan_name, :string
    field :insurance_plan_type, :string
    field :is_subscriber_the_patient, :boolean
    field :patient_relationship_to_subscriber, :string
    field :photo_back, :string
    field :photo_front, :string
    field :subscriber_address, :string
    field :subscriber_city, :string
    field :subscriber_country, :string
    field :subscriber_date_of_birth, :naive_datetime
    field :subscriber_first_name, :string
    field :subscriber_gender, :string
    field :subscriber_last_name, :string
    field :subscriber_middle_name, :string
    field :subscriber_social_security, :string
    field :subscriber_state, :string
    field :subscriber_suffix, :string
    field :subscriber_zip_code, :string
  end
end
