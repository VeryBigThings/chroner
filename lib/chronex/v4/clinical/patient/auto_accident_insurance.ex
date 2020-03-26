defmodule Chronex.V4.Clinical.Patient.AutoAccidentInsurance do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema"

  use Chronex.Schema

  @type upsert_params :: %{
          optional(:auto_accident_case_number) => String.t(),
          optional(:auto_accident_claim_rep_address) => String.t(),
          optional(:auto_accident_claim_rep_city) => String.t(),
          optional(:auto_accident_claim_rep_is_insurer) => boolean(),
          optional(:auto_accident_claim_rep_name) => String.t(),
          optional(:auto_accident_claim_rep_state) => String.t(),
          optional(:auto_accident_claim_rep_zip) => String.t(),
          optional(:auto_accident_company) => String.t(),
          optional(:auto_accident_date_of_accident) => String.t(),
          optional(:auto_accident_disabled_from_date) => String.t(),
          optional(:auto_accident_disabled_to_date) => String.t(),
          optional(:auto_accident_had_similar_condition) => boolean(),
          optional(:auto_accident_is_subscriber_the_patient) => boolean(),
          optional(:auto_accident_notes) => String.t(),
          optional(:auto_accident_patient_relationship_to_subscriber) => String.t(),
          optional(:auto_accident_payer_address) => String.t(),
          optional(:auto_accident_payer_city) => String.t(),
          optional(:auto_accident_payer_id) => String.t(),
          optional(:auto_accident_payer_state) => String.t(),
          optional(:auto_accident_payer_zip) => String.t(),
          optional(:auto_accident_policy_number) => String.t(),
          optional(:auto_accident_return_to_work_date) => String.t(),
          optional(:auto_accident_significant_injury_notes) => String.t(),
          optional(:auto_accident_significant_injury) => String.t(),
          optional(:auto_accident_similar_condition_date) => String.t(),
          optional(:auto_accident_similar_condition_notes) => String.t(),
          optional(:auto_accident_state_of_occurrence) => String.t(),
          optional(:auto_accident_still_under_care) => boolean(),
          optional(:auto_accident_subscriber_address) => String.t(),
          optional(:auto_accident_subscriber_city) => String.t(),
          optional(:auto_accident_subscriber_date_of_birth) => String.t(),
          optional(:auto_accident_subscriber_first_name) => String.t(),
          optional(:auto_accident_subscriber_last_name) => String.t(),
          optional(:auto_accident_subscriber_middle_name) => String.t(),
          optional(:auto_accident_subscriber_phone_number) => String.t(),
          optional(:auto_accident_subscriber_social_security) => String.t(),
          optional(:auto_accident_subscriber_state) => String.t(),
          optional(:auto_accident_subscriber_suffix) => String.t(),
          optional(:auto_accident_subscriber_zip_code) => String.t(),
          optional(:auto_accident_treatment_duration) => String.t(),
          optional(:auto_accident_will_require_therapy_rec) => String.t(),
          optional(:auto_accident_will_require_therapy) => boolean()
        }

  @type t :: %__MODULE__{
          auto_accident_case_number: String.t(),
          auto_accident_claim_rep_address: String.t(),
          auto_accident_claim_rep_city: String.t(),
          auto_accident_claim_rep_is_insurer: boolean(),
          auto_accident_claim_rep_name: String.t(),
          auto_accident_claim_rep_state: String.t(),
          auto_accident_claim_rep_zip: String.t(),
          auto_accident_company: String.t(),
          auto_accident_date_of_accident: DateTime.t(),
          auto_accident_disabled_from_date: DateTime.t(),
          auto_accident_disabled_to_date: DateTime.t(),
          auto_accident_had_similar_condition: boolean(),
          auto_accident_is_subscriber_the_patient: boolean(),
          auto_accident_notes: String.t(),
          auto_accident_patient_relationship_to_subscriber: String.t(),
          auto_accident_payer_address: String.t(),
          auto_accident_payer_city: String.t(),
          auto_accident_payer_id: String.t(),
          auto_accident_payer_state: String.t(),
          auto_accident_payer_zip: String.t(),
          auto_accident_policy_number: String.t(),
          auto_accident_return_to_work_date: DateTime.t(),
          auto_accident_significant_injury_notes: String.t(),
          auto_accident_significant_injury: String.t(),
          auto_accident_similar_condition_date: DateTime.t(),
          auto_accident_similar_condition_notes: String.t(),
          auto_accident_state_of_occurrence: String.t(),
          auto_accident_still_under_care: boolean(),
          auto_accident_subscriber_address: String.t(),
          auto_accident_subscriber_city: String.t(),
          auto_accident_subscriber_date_of_birth: DateTime.t(),
          auto_accident_subscriber_first_name: String.t(),
          auto_accident_subscriber_last_name: String.t(),
          auto_accident_subscriber_middle_name: String.t(),
          auto_accident_subscriber_phone_number: String.t(),
          auto_accident_subscriber_social_security: String.t(),
          auto_accident_subscriber_state: String.t(),
          auto_accident_subscriber_suffix: String.t(),
          auto_accident_subscriber_zip_code: String.t(),
          auto_accident_treatment_duration: String.t(),
          auto_accident_will_require_therapy_rec: String.t(),
          auto_accident_will_require_therapy: boolean()
        }

  embedded_schema do
    field :auto_accident_case_number, :string
    field :auto_accident_claim_rep_address, :string
    field :auto_accident_claim_rep_city, :string
    field :auto_accident_claim_rep_is_insurer, :boolean
    field :auto_accident_claim_rep_name, :string
    field :auto_accident_claim_rep_state, :string
    field :auto_accident_claim_rep_zip, :string
    field :auto_accident_company, :string
    field :auto_accident_date_of_accident, :naive_datetime
    field :auto_accident_disabled_from_date, :naive_datetime
    field :auto_accident_disabled_to_date, :naive_datetime
    field :auto_accident_had_similar_condition, :boolean
    field :auto_accident_is_subscriber_the_patient, :boolean
    field :auto_accident_notes, :string
    field :auto_accident_patient_relationship_to_subscriber, :string
    field :auto_accident_payer_address, :string
    field :auto_accident_payer_city, :string
    field :auto_accident_payer_id, :string
    field :auto_accident_payer_state, :string
    field :auto_accident_payer_zip, :string
    field :auto_accident_policy_number, :string
    field :auto_accident_return_to_work_date, :naive_datetime
    field :auto_accident_significant_injury_notes, :string
    field :auto_accident_significant_injury, :string
    field :auto_accident_similar_condition_date, :naive_datetime
    field :auto_accident_similar_condition_notes, :string
    field :auto_accident_state_of_occurrence, :string
    field :auto_accident_still_under_care, :boolean
    field :auto_accident_subscriber_address, :string
    field :auto_accident_subscriber_city, :string
    field :auto_accident_subscriber_date_of_birth, :string
    field :auto_accident_subscriber_first_name, :string
    field :auto_accident_subscriber_last_name, :string
    field :auto_accident_subscriber_middle_name, :string
    field :auto_accident_subscriber_phone_number, :string
    field :auto_accident_subscriber_social_security, :string
    field :auto_accident_subscriber_state, :string
    field :auto_accident_subscriber_suffix, :string
    field :auto_accident_subscriber_zip_code, :string
    field :auto_accident_treatment_duration, :string
    field :auto_accident_will_require_therapy_rec, :string
    field :auto_accident_will_require_therapy, :boolean
  end
end
