defmodule Chroner.V4.Clinical.Patient do
  @moduledoc "Patient schema according to https://rdecicca.drchrono.com/openapi-schema and https://rdecicca.drchrono.com/api-docs-old/v4/documentation#apipatients"

  use Chroner.Schema

  alias Chroner.V4.Administrative.Doctor
  alias Chroner.V4.Clinical.Customs.CustomDemographic
  alias Chroner.V4.Clinical.{PatientFlag, PatientFlagAttached}

  alias Chroner.V4.Clinical.Patient.{
    AutoAccidentInsurance,
    Insurance,
    ReferringDoctor,
    WorkerCompInsurance
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

  @type gender :: :"" | :Male | :Female | :Other | :UNK | :ASKU

  @type patient_payment_profile ::
          :""
          | :Cash
          | :Insurance
          | :"Insurance Out of Network"
          | :"Auto Accident"
          | :"Worker's Comp"

  @type patient_status :: :A | :I | :D

  @type race :: :blank | :indian | :asian | :black | :hawaiian | :white | :declined

  @type t :: %__MODULE__{
          address: String.t(),
          auto_accident_insurance: AutoAccidentInsurance.t(),
          cell_phone: String.t(),
          chart_id: String.t(),
          city: String.t(),
          copay: String.t(),
          custom_demographics: list(CustomDemographic.t()),
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
          patient_flags_attached: list(PatientFlagAttached.t()),
          patient_flags: list(PatientFlag.t()),
          patient_payment_profile: patient_payment_profile(),
          patient_photo_date: String.t(),
          patient_photo: String.t(),
          patient_status: patient_status(),
          preferred_language: String.t(),
          primary_care_physician: String.t(),
          primary_insurance: Insurance.t(),
          race: race(),
          referring_doctor: ReferringDoctor.t(),
          referring_source: String.t(),
          responsible_party_email: String.t(),
          responsible_party_name: String.t(),
          responsible_party_phone: String.t(),
          responsible_party_relation: String.t(),
          secondary_insurance: Insurance.t(),
          social_security_number: String.t(),
          state: String.t(),
          tertiary_insurance: Insurance.t(),
          updated_at: String.t(),
          workers_comp_insurance: WorkerCompInsurance.t(),
          zip_code: String.t()
        }

  @type upsert_params :: %{
          optional(:address) => String.t(),
          optional(:auto_accident_insurance) => AutoAccidentInsurance.upsert_params(),
          optional(:cell_phone) => String.t(),
          optional(:chart_id) => String.t(),
          optional(:city) => String.t(),
          optional(:copay) => String.t(),
          optional(:custom_demographics) => list(CustomDemographic.upsert_params()),
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
          optional(:patient_flags_attached) => list(PatientFlagAttached.upsert_params()),
          optional(:patient_payment_profile) => patient_payment_profile(),
          optional(:patient_photo_date) => String.t(),
          optional(:patient_photo) => String.t(),
          optional(:patient_status) => patient_status(),
          optional(:preferred_language) => String.t(),
          optional(:primary_care_physician) => String.t(),
          optional(:primary_insurance) => Insurance.upsert_params(),
          optional(:race) => race(),
          optional(:referring_doctor) => ReferringDoctor.upsert_params(),
          optional(:referring_source) => String.t(),
          optional(:responsible_party_email) => String.t(),
          optional(:responsible_party_name) => String.t(),
          optional(:responsible_party_phone) => String.t(),
          optional(:responsible_party_relation) => String.t(),
          optional(:secondary_insurance) => Insurance.upsert_params(),
          optional(:social_security_number) => String.t(),
          optional(:state) => String.t(),
          optional(:tertiary_insurance) => Insurance.upsert_params(),
          optional(:workers_comp_insurance) => WorkerCompInsurance.upsert_params(),
          optional(:zip_code) => String.t()
        }

  embedded_schema do
    field :address, :string
    embeds_one :auto_accident_insurance, AutoAccidentInsurance
    field :cell_phone, :string
    field :chart_id, :string
    field :city, :string
    field :copay, :string
    embeds_many :custom_demographics, CustomDemographic
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
    embeds_many :patient_flags_attached, PatientFlagAttached
    embeds_many :patient_flags, PatientFlag
    field :patient_payment_profile, :string
    field :patient_photo_date, :string
    field :patient_photo, :string
    field :patient_status, :string
    field :preferred_language, :string
    field :primary_care_physician, :string
    embeds_one :primary_insurance, Insurance
    field :race, :string
    embeds_one :referring_doctor, Doctor
    field :referring_source, :string
    field :responsible_party_email, :string
    field :responsible_party_name, :string
    field :responsible_party_phone, :string
    field :responsible_party_relation, :string
    embeds_one :secondary_insurance, Insurance
    field :social_security_number, :string
    field :state, :string
    embeds_one :tertiary_insurance, Insurance
    field :updated_at, :string
    embeds_one :workers_comp_insurance, WorkerCompInsurance
    field :zip_code, :string
  end

  def plural, do: "patients"
end
