defmodule Chroner.V4.Clinical.Patient.WorkerCompInsurance do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema"

  use Chroner.Schema

  @type upsert_params :: %{
          optional(:property_and_casualty_agency_claim_number) => String.t(),
          optional(:workers_comp_carrier_code) => String.t(),
          optional(:workers_comp_case_number) => String.t(),
          optional(:workers_comp_company) => String.t(),
          optional(:workers_comp_date_of_accident) => String.t(),
          optional(:workers_comp_group_name) => String.t(),
          optional(:workers_comp_group_number) => String.t(),
          optional(:workers_comp_notes) => String.t(),
          optional(:workers_comp_payer_address) => String.t(),
          optional(:workers_comp_payer_city) => String.t(),
          optional(:workers_comp_payer_id) => String.t(),
          optional(:workers_comp_payer_state) => String.t(),
          optional(:workers_comp_payer_zip) => String.t(),
          optional(:workers_comp_state_of_occurrence) => String.t(),
          optional(:workers_comp_wcb_rating_code) => String.t(),
          optional(:workers_comp_wcb) => String.t()
        }

  @type t :: %__MODULE__{
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

  embedded_schema do
    field :property_and_casualty_agency_claim_number, :string
    field :workers_comp_carrier_code, :string
    field :workers_comp_case_number, :string
    field :workers_comp_company, :string
    field :workers_comp_date_of_accident, :string
    field :workers_comp_group_name, :string
    field :workers_comp_group_number, :string
    field :workers_comp_notes, :string
    field :workers_comp_payer_address, :string
    field :workers_comp_payer_city, :string
    field :workers_comp_payer_id, :string
    field :workers_comp_payer_state, :string
    field :workers_comp_payer_zip, :string
    field :workers_comp_state_of_occurrence, :string
    field :workers_comp_wcb_rating_code, :string
    field :workers_comp_wcb, :string
  end
end
