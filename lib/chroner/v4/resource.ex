defmodule Chroner.V4.Resource do
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
    with {:ok, %Response{body: data, status_code: 201}} <-
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
    with {:ok, %Response{body: data, status_code: 200}} <-
           Client.get(client, "/#{module.plural()}/current"),
         do: {:ok, cast_resource(module, data)}
  end

  @spec delete(client, integer(), module()) :: :ok | error
  def delete(client, id, module) do
    with {:ok, %Response{status_code: 204}} <-
           Client.delete(client, "/#{module.plural()}/#{id}"),
         do: :ok
  end

  @spec list(client, module(), map()) :: {:ok, [struct()] | []} | error
  def list(client, module, params \\ %{}) do
    with {:ok, %Response{body: %{"results" => data}, status_code: 200}} <-
           Client.get(client, "/#{module.plural()}", [], params: params),
         do: {:ok, cast_resource(module, data)}
  end

  @spec partial_update(client, integer(), map(), module()) ::
          success | error
  def partial_update(client, id, params, module) do
    with {:ok, %Response{status_code: 204}} <-
           Client.patch(
             client,
             "/#{module.plural()}/#{id}",
             params,
             upsert_headers()
           ),
         do: :ok
  end

  @spec read(client, integer(), module()) :: success | error
  def read(client, id, module) do
    with {:ok, %Response{body: data, status_code: 200}} <-
           Client.get(client, "/#{module.plural()}/#{id}"),
         do: {:ok, cast_resource(module, data)}
  end

  @spec update(client, integer(), map(), module()) ::
          success | error
  def update(client, id, params, module) do
    with {:ok, %Response{status_code: 204}} <-
           Client.put(
             client,
             "/#{module.plural()}/#{id}",
             params,
             upsert_headers()
           ),
         do: :ok
  end

  def upsert_headers do
    [
      {"content-type", "application/x-www-form-urlencoded"},
      {"accept", "application/json"}
    ]
  end

  def cast_resource(type, %_{} = data),
    do: struct(type, Map.from_struct(data))

  def cast_resource(type, data) when is_map(data) do
    data
    |> EctoMorph.cast_to_struct(type)
    |> elem(1)
  end

  def cast_resource(type, data) when is_list(data),
    do: Enum.map(data, &cast_resource(type, &1))
end
