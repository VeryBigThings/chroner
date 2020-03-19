defmodule Chroner.Resource do
  alias Chroner.{Response, Request}
  alias OAuth2.Client

  @spec create(Client.t(), map(), module()) :: {:ok, struct()} | {:error, Response.t()}
  def create(client, params, module) do
    with {:ok, %Response{body: data}} <-
           Request.post(client, "/#{module.plural()}", params, Request.upsert_headers()),
         do: {:ok, Response.resource(module, data)}
  end

  @spec current(Client.t(), module()) :: {:ok, struct()} | {:error, Response.t()}
  def current(client, module) do
    with {:ok, %Response{body: data}} <-
           Request.get(client, "/#{module.plural()}/current"),
         do: {:ok, Response.resource(module, data)}
  end

  @spec delete(Client.t(), integer(), module()) :: :ok | {:error, Response.t()}
  def delete(client, id, module) do
    with {:ok, _} <-
           Request.delete(client, "/#{module.plural()}/#{id}"),
         do: :ok
  end

  @spec list(Client.t(), module()) :: {:ok, list(struct())} | {:error, Response.t()}
  def list(client, module) do
    with {:ok, %Response{body: %{"results" => data}}} <-
           Request.get(client, "/#{module.plural()}"),
         do: {:ok, Response.resource(module, data)}
  end

  @spec partial_update(Client.t(), integer(), map(), module()) ::
          {:ok, struct()} | {:error, Response.t()}
  def partial_update(client, id, params, module) do
    with {:ok, %Response{body: data}} <-
           Request.patch(client, "/#{module.plural()}/#{id}", params, Request.upsert_headers()),
         do: {:ok, Response.resource(module, data)}
  end

  @spec read(Client.t(), integer(), module()) :: {:ok, struct()} | {:error, Response.t()}
  def read(client, id, module) do
    with {:ok, %Response{body: data}} <-
           Request.get(client, "/#{module.plural()}/#{id}"),
         do: {:ok, Response.resource(module, data)}
  end

  @spec update(Client.t(), integer(), map(), module()) :: {:ok, struct()} | {:error, Response.t()}
  def update(client, id, params, module) do
    with {:ok, %Response{body: data}} <-
           Request.put(client, "/#{module.plural()}/#{id}", params, Request.upsert_headers()),
         do: {:ok, Response.resource(module, data)}
  end
end
