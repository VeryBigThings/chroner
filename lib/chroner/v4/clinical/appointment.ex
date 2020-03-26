defmodule Chroner.V4.Clinical.Appointment do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema and https://rdecicca.drchrono.com/api-docs-old/v4/documentation#apiappointments"

  use Chroner.Schema

  alias Chroner.V4.Clinical.{
    BillingNote,
    ClinicalNote,
    Reminder,
    StatusTransition,
    Vitals
  }

  alias Chroner.V4.Clinical.Customs.{CustomField, CustomVital}

  @type billing_status ::
          :"Auto Accident Claim"
          | :"Balance Due"
          | :"Bill Insurance"
          | :"Bill Secondary Insurance"
          | :"Durable Medical Equipment Claim"
          | :"Internal Review"
          | :"Paid In Full"
          | :Settled
          | :"Worker's Comp Claim"

  @type list_params :: %{
          optional(:cursor) => String.t(),
          required(:date) => String.t(),
          required(:date_range) => String.t(),
          optional(:doctor) => integer(),
          optional(:office) => integer(),
          optional(:page_size) => integer(),
          optional(:patient) => integer(),
          required(:since) => String.t(),
          optional(:status) => String.t()
        }

  @type partial_update_params :: %{
          optional(:allow_overlapping) => boolean(),
          optional(:billing_status) => billing_status(),
          optional(:color) => String.t(),
          optional(:custom_fields) => String.t(),
          optional(:custom_vitals) => [CustomVital.upsert_params()],
          optional(:is_walk_in) => boolean(),
          optional(:notes) => String.t(),
          optional(:profile) => integer(),
          optional(:reason) => String.t(),
          optional(:reminder_profile) => integer(),
          optional(:reminders) => String.t(),
          optional(:status) => status(),
          optional(:vitals) => Vitals.upsert_params(),
          optional(:doctor) => integer(),
          optional(:duration) => integer(),
          optional(:exam_room) => integer(),
          optional(:office) => integer(),
          optional(:patient) => integer() | nil,
          optional(:scheduled_time) => DateTime.t()
        }

  @type t :: %__MODULE__{
          allow_overlapping: boolean(),
          appt_is_break: boolean(),
          base_recurring_appointment: integer(),
          billing_notes: [BillingNote.t()],
          billing_provider: integer(),
          billing_status: billing_status(),
          clinical_note: ClinicalNote.t(),
          cloned_from: integer() | nil,
          color: String.t(),
          created_at: DateTime.t(),
          custom_fields: [CustomField.t()],
          custom_vitals: [CustomVital.t()],
          deleted_flag: boolean(),
          doctor: integer(),
          duration: integer(),
          exam_room: integer(),
          extended_updated_at: DateTime.t(),
          first_billed_date: String.t(),
          icd10_codes: String.t() | nil,
          icd9_codes: String.t() | nil,
          id: integer(),
          is_virtual_base: boolean(),
          is_walk_in: boolean(),
          last_billed_date: DateTime.t(),
          notes: String.t(),
          office: integer(),
          patient: integer() | nil,
          primary_insurance_id_number: String.t(),
          primary_insurer_name: String.t(),
          primary_insurer_payer_id: String.t(),
          profile: integer(),
          reason: String.t(),
          recurring_appointment: boolean(),
          reminder_profile: integer(),
          reminders: [Reminder.t()],
          scheduled_time: DateTime.t(),
          secondary_insurance_id_number: String.t(),
          secondary_insurer_name: String.t(),
          secondary_insurer_payer_id: String.t(),
          status_transitions: [StatusTransition.t()],
          status: status(),
          supervising_provider: integer(),
          updated_at: DateTime.t(),
          vitals: Vitals.t()
        }

  @type upsert_params :: %{
          optional(:allow_overlapping) => boolean(),
          optional(:billing_status) => billing_status(),
          optional(:color) => String.t(),
          optional(:custom_fields) => String.t(),
          optional(:custom_vitals) => [CustomVital.upsert_params()],
          optional(:is_walk_in) => boolean(),
          optional(:notes) => String.t(),
          optional(:profile) => integer(),
          optional(:reason) => String.t(),
          optional(:reminder_profile) => integer(),
          optional(:reminders) => String.t(),
          optional(:status) => status(),
          optional(:vitals) => Vitals.upsert_params(),
          required(:doctor) => integer(),
          required(:duration) => integer(),
          required(:exam_room) => integer(),
          required(:office) => integer(),
          required(:patient) => integer() | nil,
          required(:scheduled_time) => DateTime.t()
        }

  @type status ::
          :""
          | :Arrived
          | :"Checked In"
          | :"In Room"
          | :Cancelled
          | :Complete
          | :Confirmed
          | :"In Session"
          | :"No Show"
          | :"Not Confirmed"
          | :Rescheduled

  embedded_schema do
    field :allow_overlapping, :boolean
    field :appt_is_break, :boolean
    field :base_recurring_appointment, :integer
    embeds_many :billing_notes, BillingNote
    field :billing_provider, :integer
    field :billing_status, :string
    embeds_one :clinical_note, ClinicalNote
    field :cloned_from, :integer
    field :color, :string
    field :created_at, :naive_datetime
    embeds_many :custom_fields, CustomField
    embeds_many :custom_vitals, CustomVital
    field :deleted_flag, :boolean
    field :doctor, :integer
    field :duration, :integer
    field :exam_room, :integer
    field :extended_updated_at, :naive_datetime
    field :first_billed_date, :string
    field :icd10_codes, {:array, :string}
    field :icd9_codes, {:array, :string}
    field :id, :integer
    field :is_virtual_base, :boolean
    field :is_walk_in, :boolean
    field :last_billed_date, :naive_datetime
    field :notes, :string
    field :office, :integer
    field :patient, :integer
    field :primary_insurance_id_number, :string
    field :primary_insurer_name, :string
    field :primary_insurer_payer_id, :string
    field :profile, :integer
    field :reason, :string, default: ""
    field :recurring_appointment, :boolean
    field :reminder_profile, :integer
    embeds_many :reminders, Reminder
    field :scheduled_time, :naive_datetime
    field :secondary_insurance_id_number, :string
    field :secondary_insurer_name, :string
    field :secondary_insurer_payer_id, :string
    field :status, :string
    embeds_many :status_transitions, StatusTransition
    field :supervising_provider, :integer
    field :updated_at, :naive_datetime
    embeds_one :vitals, Vitals
  end

  def plural, do: "appointments"
end
