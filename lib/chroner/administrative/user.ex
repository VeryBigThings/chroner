defmodule Chroner.Administrative.User do
  @derive [Poison.Encoder]

  @type permissions :: %{
          access_all_messages_for_practice_group: boolean(),
          "access_balance/ledger": boolean(),
          access_billing: boolean(),
          access_clinical_notes: boolean(),
          access_institutional_billing: boolean(),
          access_patient_analytics: boolean(),
          access_patient_payments: boolean(),
          access_patient_statements: boolean(),
          access_reports: boolean(),
          access_scheduling: boolean(),
          access_to_erx: boolean(),
          access_to_message_center: boolean(),
          add_new_referring_sources: boolean(),
          appointment_provider_selection: boolean(),
          billing_administrator: boolean(),
          create_and_update_contacts: boolean(),
          create_and_update_patients: boolean(),
          drug_interactions_check: boolean(),
          emergency_access: boolean(),
          export_patients: boolean(),
          manage_accounts: boolean(),
          manage_permissions: boolean(),
          manage_templates: boolean(),
          provider_dropdown: boolean(),
          settings: boolean(),
          share_patients: boolean(),
          show_billing_summary: boolean(),
          show_billing_tab: boolean(),
          show_patient_balance: boolean(),
          "sign/lock_clinical_notes": boolean(),
          use_ipad_ehr: boolean(),
          view_practice_group: boolean()
        }

  @type t :: %__MODULE__{
          doctor: integer(),
          id: integer(),
          is_doctor: String.t(),
          is_staff: String.t(),
          permissions: permissions,
          practice_group: integer(),
          username: String.t()
        }

  defstruct [
    :doctor,
    :id,
    :is_doctor,
    :is_staff,
    :permissions,
    :practice_group,
    :username
  ]
end
