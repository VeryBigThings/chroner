defmodule Chroner.Response do
  @type t :: %__MODULE__{
          status_code: integer(),
          headers: [{binary, binary}],
          body: binary | map | list
        }

  defstruct status_code: nil, headers: [], body: nil

  @doc false
  def resource(type, data) when is_map(data), do: struct(type, atomize_keys(data))

  def resource(type, data) when is_list(data),
    do: Enum.map(data, &resource(type, &1))

  def resource(type, _), do: struct(type)

  @doc false
  def atomize_keys(map) when is_map(map), do: atomize_map_keys(map)
  def atomize_keys(other), do: other

  defp atomize_map_keys(map),
    do: for({k, v} <- map, into: %{}, do: {String.to_atom(k), atomize_keys(v)})
end
