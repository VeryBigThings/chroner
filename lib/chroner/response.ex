defmodule Chroner.Response do
  @type t :: %__MODULE__{
          status_code: integer(),
          headers: [{binary, binary}],
          body: binary | map | list
        }

  defstruct status_code: nil, headers: [], body: nil

  @doc false
  def resource(type, data) when is_struct(data),
    do: struct(type, atomize_keys(Map.from_struct(data)))

  def resource(type, data) when is_map(data), do: struct(type, atomize_keys(data))

  def resource(type, data) when is_list(data),
    do: Enum.map(data, &resource(type, &1))

  def resource(type, _), do: struct(type)

  @doc false
  defp atomize_keys(map) when is_map(map), do: atomize_map_keys(map)
  defp atomize_keys(other), do: other

  defp atomize_map_keys(map) do
    map
    |> Enum.map(fn
      {key, value} when is_binary(key) -> {String.to_atom(key), atomize_keys(value)}
      {key, value} -> {key, atomize_keys(value)}
    end)
    |> Enum.into(%{})
  end
end
