defmodule Chroner.Administrative.Permissions do
  use Ecto.Schema

  @primary_key false
  @derive [Poison.Encoder]

  @type t :: %__MODULE__{
          :access_all_messages_for_practice_group => boolean(),
          :"access_balance/ledger" => boolean(),
          :access_billing => boolean(),
          :access_clinical_notes => boolean(),
          :access_institutional_billing => boolean(),
          :access_patient_analytics => boolean(),
          :access_patient_payments => boolean(),
          :access_patient_statements => boolean(),
          :access_reports => boolean(),
          :access_scheduling => boolean(),
          :access_to_erx => boolean(),
          :access_to_message_center => boolean(),
          :add_new_referring_sources => boolean(),
          :appointment_provider_selection => boolean(),
          :billing_administrator => boolean(),
          :create_and_update_contacts => boolean(),
          :create_and_update_patients => boolean(),
          :drug_interactions_check => boolean(),
          :emergency_access => boolean(),
          :export_patients => boolean(),
          :manage_accounts => boolean(),
          :manage_permissions => boolean(),
          :manage_templates => boolean(),
          :provider_dropdown => boolean(),
          :settings => boolean(),
          :share_patients => boolean(),
          :show_billing_summary => boolean(),
          :show_billing_tab => boolean(),
          :show_patient_balance => boolean(),
          :"sign/lock_clinical_notes" => boolean(),
          :use_ipad_ehr => boolean(),
          :view_practice_group => boolean()
        }

  embedded_schema do
    field :access_all_messages_for_practice_group, :boolean
    field :"access_balance/ledger", :boolean
    field :access_billing, :boolean
    field :access_clinical_notes, :boolean
    field :access_institutional_billing, :boolean
    field :access_patient_analytics, :boolean
    field :access_patient_payments, :boolean
    field :access_patient_statements, :boolean
    field :access_reports, :boolean
    field :access_scheduling, :boolean
    field :access_to_erx, :boolean
    field :access_to_message_center, :boolean
    field :add_new_referring_sources, :boolean
    field :appointment_provider_selection, :boolean
    field :billing_administrator, :boolean
    field :create_and_update_contacts, :boolean
    field :create_and_update_patients, :boolean
    field :drug_interactions_check, :boolean
    field :emergency_access, :boolean
    field :export_patients, :boolean
    field :manage_accounts, :boolean
    field :manage_permissions, :boolean
    field :manage_templates, :boolean
    field :provider_dropdown, :boolean
    field :settings, :boolean
    field :share_patients, :boolean
    field :show_billing_summary, :boolean
    field :show_billing_tab, :boolean
    field :show_patient_balance, :boolean
    field :"sign/lock_clinical_notes", :boolean
    field :use_ipad_ehr, :boolean
    field :view_practice_group, :boolean
  end

  def plural, do: "permissions"
end
