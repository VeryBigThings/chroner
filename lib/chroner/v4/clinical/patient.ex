defmodule Chroner.V4.Clinical.Patient do
  @moduledoc "Patient schema according to https://rdecicca.drchrono.com/openapi-schema and https://rdecicca.drchrono.com/api-docs-old/v4/documentation#apipatients"

  use Chroner.Schema

  alias Chroner.V4.Administrative.Doctor

  @type auto_accident_insurance :: %{
          auto_accident_case_number: String.t(),
          auto_accident_claim_rep_address: String.t(),
          auto_accident_claim_rep_city: String.t(),
          auto_accident_claim_rep_is_insurer: boolean(),
          auto_accident_claim_rep_name: String.t(),
          auto_accident_claim_rep_state: String.t(),
          auto_accident_claim_rep_zip: String.t(),
          auto_accident_company: String.t(),
          auto_accident_date_of_accident: String.t(),
          auto_accident_disabled_from_date: String.t(),
          auto_accident_disabled_to_date: String.t(),
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
          auto_accident_return_to_work_date: String.t(),
          auto_accident_significant_injury_notes: String.t(),
          auto_accident_significant_injury: String.t(),
          auto_accident_similar_condition_date: String.t(),
          auto_accident_similar_condition_notes: String.t(),
          auto_accident_state_of_occurrence: String.t(),
          auto_accident_still_under_care: boolean(),
          auto_accident_subscriber_address: String.t(),
          auto_accident_subscriber_city: String.t(),
          auto_accident_subscriber_date_of_birth: String.t(),
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

  @type custom_demographic :: %{
          field_type: integer(),
          updated_at: String.t(),
          value: String.t()
        }

  @type ethnicity :: :blank | :hispanic | :not_hispanic | :declined

  @type filter_params :: %{
          optional(:date_of_birth) => String.t(),
          optional(:doctor) => integer(),
          optional(:email) => String.t(),
          optional(:ethnicity) => ethnicity(),
          optional(:first_name) => String.t(),
          optional(:gender) => gender,
          optional(:last_name) => String.t(),
          optional(:preferred_language) => String.t(),
          optional(:race) => race(),
          optional(:offices) => String.t(),
          optional(:since) => String.t(),
          optional(:show_inactive) => boolean()
        }

  @type insurance :: %{
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
          subscriber_date_of_birth: String.t(),
          subscriber_first_name: String.t(),
          subscriber_gender: gender(),
          subscriber_last_name: String.t(),
          subscriber_middle_name: String.t(),
          subscriber_social_security: String.t(),
          subscriber_state: String.t(),
          subscriber_suffix: String.t(),
          subscriber_zip_code: String.t()
        }

  @type gender :: :"" | :Male | :Female | :Other | :UNK | :ASKU

  @type patient_flag :: %{
          archived: boolean(),
          color: String.t(),
          created_at: String.t(),
          doctor: integer(),
          id: integer(),
          name: String.t(),
          priority: integer(),
          updated_at: String.t()
        }

  @type patient_payment_profile ::
          :""
          | :Cash
          | :Insurance
          | :"Insurance Out of Network"
          | :"Auto Accident"
          | :"Worker's Comp"
  @type patient_status :: :A | :I | :D
  @type race :: :blank | :indian | :asian | :black | :hawaiian | :white | :declined

  @type upsert_params :: %{
          optional(:address) => String.t(),
          optional(:auto_accident_insurance) => auto_accident_insurance,
          optional(:cell_phone) => String.t(),
          optional(:chart_id) => String.t(),
          optional(:city) => String.t(),
          optional(:copay) => String.t(),
          optional(:custom_demographics) => list(custom_demographic),
          optional(:date_of_birth) => String.t(),
          optional(:date_of_first_appointment) => String.t(),
          optional(:date_of_last_appointment) => String.t(),
          optional(:default_pharmacy) => String.t(),
          optional(:disable_sms_messages) => boolean(),
          required(:doctor) => integer(),
          optional(:email) => String.t(),
          optional(:emergency_contact_name) => String.t(),
          optional(:emergency_contact_phone) => String.t(),
          optional(:emergency_contact_relation) => String.t(),
          optional(:employer_address) => String.t(),
          optional(:employer_city) => String.t(),
          optional(:employer_state) => String.t(),
          optional(:employer_zip_code) => String.t(),
          optional(:employer) => String.t(),
          optional(:ethnicity) => ethnicity(),
          optional(:first_name) => String.t(),
          required(:gender) => gender,
          optional(:home_phone) => String.t(),
          optional(:last_name) => String.t(),
          optional(:middle_name) => String.t(),
          optional(:nick_name) => String.t(),
          optional(:office_phone) => String.t(),
          optional(:patient_flags_attached) => list(patient_flag),
          optional(:patient_payment_profile) => patient_payment_profile(),
          optional(:patient_photo_date) => String.t(),
          optional(:patient_photo) => String.t(),
          optional(:patient_status) => patient_status(),
          optional(:preferred_language) => String.t(),
          optional(:primary_care_physician) => String.t(),
          optional(:primary_insurance) => insurance,
          optional(:race) => race(),
          optional(:referring_doctor) => Doctor.t(),
          optional(:referring_source) => String.t(),
          optional(:responsible_party_email) => String.t(),
          optional(:responsible_party_name) => String.t(),
          optional(:responsible_party_phone) => String.t(),
          optional(:responsible_party_relation) => String.t(),
          optional(:secondary_insurance) => insurance,
          optional(:social_security_number) => String.t(),
          optional(:state) => String.t(),
          optional(:tertiary_insurance) => insurance,
          optional(:workers_comp_insurance) => workers_comp_insurance,
          optional(:zip_code) => String.t()
        }

  @type workers_comp_insurance :: %{
          property_and_casualty_agency_claim_number: String.t(),
          workers_comp_carrier_code: String.t(),
          workers_comp_case_number: String.t(),
          workers_comp_company: String.t(),
          workers_comp_date_of_accident: String.t(),
          workers_comp_group_name: String.t(),
          workers_comp_group_number: String.t(),
          workers_comp_notes: String.t(),
          workers_comp_payer_address: String.t(),
          workers_comp_payer_city: String.t(),
          workers_comp_payer_id: String.t(),
          workers_comp_payer_state: String.t(),
          workers_comp_payer_zip: String.t(),
          workers_comp_state_of_occurrence: String.t(),
          workers_comp_wcb_rating_code: String.t(),
          workers_comp_wcb: String.t()
        }

  @type t :: %__MODULE__{
          address: String.t(),
          auto_accident_insurance: auto_accident_insurance,
          cell_phone: String.t(),
          chart_id: String.t(),
          city: String.t(),
          copay: String.t(),
          custom_demographics: list(custom_demographic),
          date_of_birth: String.t(),
          date_of_first_appointment: String.t(),
          date_of_last_appointment: String.t(),
          default_pharmacy: String.t(),
          disable_sms_messages: boolean(),
          doctor: integer(),
          email: String.t(),
          emergency_contact_name: String.t(),
          emergency_contact_phone: String.t(),
          emergency_contact_relation: String.t(),
          employer_address: String.t(),
          employer_city: String.t(),
          employer_state: String.t(),
          employer_zip_code: String.t(),
          employer: String.t(),
          ethnicity: ethnicity(),
          first_name: String.t(),
          gender: gender,
          home_phone: String.t(),
          id: integer(),
          last_name: String.t(),
          middle_name: String.t(),
          nick_name: String.t(),
          office_phone: String.t(),
          offices: list(integer()),
          patient_flags_attached: list(patient_flag),
          patient_flags: list(patient_flag),
          patient_payment_profile: patient_payment_profile(),
          patient_photo_date: String.t(),
          patient_photo: String.t(),
          patient_status: patient_status(),
          preferred_language: String.t(),
          primary_care_physician: String.t(),
          primary_insurance: insurance,
          race: race(),
          referring_doctor: Doctor.t(),
          referring_source: String.t(),
          responsible_party_email: String.t(),
          responsible_party_name: String.t(),
          responsible_party_phone: String.t(),
          responsible_party_relation: String.t(),
          secondary_insurance: insurance,
          social_security_number: String.t(),
          state: String.t(),
          tertiary_insurance: insurance,
          updated_at: String.t(),
          workers_comp_insurance: workers_comp_insurance,
          zip_code: String.t()
        }

  embedded_schema do
    field :address, :string
    field :auto_accident_insurance, :map
    field :cell_phone, :string
    field :chart_id, :string
    field :city, :string
    field :copay, :string
    field :custom_demographics, {:array, :map}
    field :date_of_birth, :string
    field :date_of_first_appointment, :string
    field :date_of_last_appointment, :string
    field :default_pharmacy, :string
    field :disable_sms_messages, :boolean
    field :doctor, :integer
    field :email, :string
    field :emergency_contact_name, :string
    field :emergency_contact_phone, :string
    field :emergency_contact_relation, :string
    field :employer_address, :string
    field :employer_city, :string
    field :employer_state, :string
    field :employer_zip_code, :string
    field :employer, :string
    field :ethnicity, :string
    field :first_name, :string
    field :gender, :string
    field :home_phone, :string
    field :last_name, :string
    field :id, :integer
    field :middle_name, :string
    field :nick_name, :string
    field :office_phone, :string
    field :offices, {:array, :integer}
    field :patient_flags_attached, {:array, :map}
    field :patient_flags, {:array, :map}
    field :patient_payment_profile, :string
    field :patient_photo_date, :string
    field :patient_photo, :string
    field :patient_status, :string
    field :preferred_language, :string
    field :primary_care_physician, :string
    field :primary_insurance, :map
    field :race, :string
    embeds_one :referring_doctor, Doctor
    field :referring_source, :string
    field :responsible_party_email, :string
    field :responsible_party_name, :string
    field :responsible_party_phone, :string
    field :responsible_party_relation, :string
    field :secondary_insurance, :map
    field :social_security_number, :string
    field :state, :string
    field :tertiary_insurance, :map
    field :updated_at, :string
    field :workers_comp_insurance, :map
    field :zip_code, :string
  end

  def plural, do: "patients"
end
