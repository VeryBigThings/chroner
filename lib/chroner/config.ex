defmodule Chroner.Config do
  @moduledoc false

  @type t :: %__MODULE__{
          client_id: String.t(),
          client_secret: String.t(),
          redirect_uri: String.t()
        }

  defstruct [
    :client_id,
    :client_secret,
    :redirect_uri
  ]

  def get(name, default \\ nil), do: Application.get_env(:chroner, name, default)

  def redirect_uri, do: get(:redirect_uri)

  def client_id, do: get(:client_id)

  def client_secret, do: get(:client_secret)
end
