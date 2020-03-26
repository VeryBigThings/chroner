defmodule Chroner.V4.Clinical.Office do
  @moduledoc "Appointment profile schema according to https://rdecicca.drchrono.com/openapi-schema and https://rdecicca.drchrono.com/api-docs-old/v4/documentation#apioffices"

  use Chroner.Schema

  alias Chroner.V4.Clinical.Office.{ExamRoom, OnlineTimeslot}

  @type t :: %__MODULE__{
          address: String.t(),
          archived: boolean(),
          city: String.t(),
          country: String.t(),
          doctor: integer(),
          end_time: String.t(),
          exam_rooms: [ExamRoom.t()],
          fax_number: String.t(),
          id: integer(),
          name: String.t(),
          online_scheduling: boolean(),
          online_timeslots: [OnlineTimeslot],
          phone_number: String.t(),
          start_time: String.t(),
          state: String.t(),
          zip_code: String.t()
        }

  embedded_schema do
    field :address, :string
    field :archived, :boolean
    field :city, :string
    field :country, :string
    field :doctor, :integer
    field :end_time, :time
    embeds_many :exam_rooms, ExamRoom
    field :fax_number, :string
    field :id, :integer
    field :name, :string
    field :online_scheduling, :boolean
    embeds_many :online_timeslots, OnlineTimeslot
    field :phone_number, :string
    field :start_time, :time
    field :state, :string
    field :zip_code, :string
  end
end
