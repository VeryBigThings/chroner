defmodule Chroner.Resource do
  @moduledoc false

  alias OAuth2.{Client, Response}

  @type client :: Client.t()
  @type success :: {:ok, struct()}
  @type error :: {:error, OAuth2.Response.t()}

  # --------------------------------------------------------------------
  # API
  # --------------------------------------------------------------------

  @spec create(client, map(), module()) :: success | error
  def create(client, params, module) do
    with {:ok, %Response{body: data}} <-
           Client.post(
             client,
             "/#{module.plural()}",
             params,
             upsert_headers()
           ),
         do: {:ok, cast_resource(module, data)}
  end

  @spec current(client, module()) :: success | error
  def current(client, module) do
    with {:ok, %Response{body: data}} <-
           Client.get(client, "/#{module.plural()}/current"),
         do: {:ok, cast_resource(module, data)}
  end

  @spec delete(client, integer(), module()) :: :ok | error
  def delete(client, id, module) do
    with {:ok, _} <-
           Client.delete(client, "/#{module.plural()}/#{id}"),
         do: :ok
  end

  @spec list(client, module()) :: {:ok, [struct()] | []} | error
  def list(client, module) do
    with {:ok, %Response{body: %{"results" => data}}} <-
           Client.get(client, "/#{module.plural()}"),
         do: {:ok, cast_resource(module, data)}
  end

  @spec partial_update(client, integer(), map(), module()) ::
          success | error
  def partial_update(client, id, params, module) do
    with {:ok, %Response{body: data}} <-
           Client.patch(
             client,
             "/#{module.plural()}/#{id}",
             params,
             upsert_headers()
           ),
         do: {:ok, cast_resource(module, data)}
  end

  @spec read(client, integer(), module()) :: success | error
  def read(client, id, module) do
    with {:ok, %Response{body: data}} <-
           Client.get(client, "/#{module.plural()}/#{id}"),
         do: {:ok, cast_resource(module, data)}
  end

  @spec update(client, integer(), map(), module()) ::
          success | error
  def update(client, id, params, module) do
    with {:ok, %Response{body: data}} <-
           Client.put(
             client,
             "/#{module.plural()}/#{id}",
             params,
             upsert_headers()
           ),
         do: {:ok, cast_resource(module, data)}
  end

  # --------------------------------------------------------------------
  # Private functions
  # --------------------------------------------------------------------

  defp upsert_headers do
    [
      {"content-type", "application/x-www-form-urlencoded"},
      {"accept", "application/json"}
    ]
  end

  defp cast_resource(type, %_{} = data),
    do: struct(type, Map.from_struct(data))

  defp cast_resource(type, data) when is_map(data) do
    data
    |> EctoMorph.cast_to_struct(type)
    |> elem(1)
  end

  defp cast_resource(type, data) when is_list(data),
    do: Enum.map(data, &cast_resource(type, &1))
end
