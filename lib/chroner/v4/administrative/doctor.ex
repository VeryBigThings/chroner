defmodule Chroner.V4.Administrative.Doctor do
  @moduledoc "Doctor"

  use Chroner.Schema

  @type filter_params :: %{
          optional(:cursor) => String.t(),
          optional(:doctor) => integer(),
          optional(:page_size) => integer()
        }

  @type specialty ::
          :""
          | :Acupuncture
          | :"Advanced Practice Midwife"
          | :"Aesthetic Medicine"
          | :Aesthetician
          | :"Allergist/Immunologist"
          | :Anesthesiologist
          | :"Cardiac Electrophysiologist"
          | :Cardiologist
          | :"Cardiothoracic Surgeon"
          | :"Child/Adolescent Psychiatry"
          | :Chiropractor
          | :"Clinical Social Worker"
          | :"Colorectal Surgeon"
          | :Correactology
          | :"Cosmetic Medicine"
          | :"Counselor Mental Health"
          | :"Counselor Professional"
          | :Counselor
          | :Dentist
          | :Diabetology
          | :Dermatologist
          | :"Diagnostic Medical Sonographer"
          | :"Dietitian | :Registered"
          | :"Ear-Nose-Throat Specialist (ENT)"
          | :"Emergency Medicine Physician"
          | :Endocrinologist
          | :Endodontist
          | :Epidemiologist
          | :"Family Practitioner"
          | :Gastroenterologist
          | :"General Practice"
          | :"General Surgeon"
          | :Geneticist
          | :Geriatrician
          | :Gerontologist
          | :"Gynecologist (no OB)"
          | :"Gynegologic Oncologist"
          | :"Hand Surgeon"
          | :Hematologist
          | :"Home Care"
          | :Hospice
          | :Hospitalist
          | :"Infectious Disease Specialist"
          | :"Integrative and Functional Medicine"
          | :"Integrative Medicine"
          | :Internist
          | :"Interventional Radiology"
          | :"Laboratory Medicine Specialist"
          | :"Laser Surgery"
          | :"Massage Therapist"
          | :"Naturopathic Physician"
          | :Neonatologist
          | :Nephrologist
          | :Neurologist
          | :Neuropsychology
          | :Neurosurgeon
          | :"Not Actively Practicing"
          | :"Nuclear Medicine Specialist"
          | :"Nurse Practitioner"
          | :Nursing
          | :Nutritionist
          | :"Obstetrician/Gynecologist"
          | :"Occupational Medicine"
          | :"Occupational Therapist"
          | :Oncologist
          | :Ophthalmologist
          | :Optometrist
          | :"Oral Surgeon"
          | :"Orofacial Pain"
          | :Orthodontist
          | :"Orthopedic Surgeon"
          | :Orthotist
          | :Other
          | :"Pain Management Specialist"
          | :Pathologist
          | :"Pediatric Dentist"
          | :"Pediatric Gastroenterology"
          | :"Pediatric Surgeon"
          | :Pediatrician
          | :Perinatologist
          | :Periodontist
          | :"Physical Medicine and Rehab Specialist"
          | :"Physical Therapist"
          | :"Physician Assistant"
          | :"Plastic Surgeon"
          | :Podiatrist
          | :"Preventive-Aging Medicine"
          | :"Preventive Medicine/Occupational-Environmental Medicine"
          | :"Primary Care Physician"
          | :Prosthetist
          | :Prosthodontist
          | :Psychiatrist
          | :Psychologist
          | :"Public Health Professional"
          | :Pulmonologist
          | :"Radiation Oncologist"
          | :Radiologist
          | :"Registered Nurse"
          | :"Religious Nonmedical Practitioner"
          | :"Reproductive Endocrinologist"
          | :"Reproductive Medicine"
          | :Rheumatologist
          | :"Sleep Medicine"
          | :"Speech-Language Pathologist"
          | :"Sports Medicine Specialist"
          | :Urologist
          | :"Urgent Care"
          | :"Vascular Surgeon"

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
