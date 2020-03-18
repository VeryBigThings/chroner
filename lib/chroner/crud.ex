defmodule Chroner.CRUD do
  @moduledoc false

  defmacro __using__(options) do
    import_resources = options[:import] || []

    quote bind_quoted: [import_resources: import_resources] do
      alias Chroner.{Response, Request}

      for resource <- Keyword.keys(import_resources) do
        {struct, actions} = Keyword.get(import_resources, resource)

        if :create in actions do
          @spec unquote(:"#{resource}_create")(
                  OAuth2.Client.t(),
                  unquote(struct).create_params
                ) ::
                  {:ok, unquote(struct).t()} | {:error, Response.t()}
          @doc "Creates #{resource} resource."
          def unquote(:"#{resource}_create")(client, params) do
            with {:ok, %Response{body: data}} <-
                   Request.post(client, "/#{unquote(resource)}", params),
                 do: {:ok, Response.resource(unquote(struct), data)}
          end
        end

        if :current in actions do
          @spec unquote(:"#{resource}_current")(OAuth2.Client.t()) ::
                  {:ok, unquote(struct).t()} | {:error, Response.t()}
          @doc "Fetches current #{resource} resource."
          def unquote(:"#{resource}_current")(client) do
            with {:ok, %Response{body: data}} <-
                   Request.get(client, "/#{unquote(resource)}/current"),
                 do: {:ok, Response.resource(unquote(struct), data)}
          end
        end

        if :delete in actions do
          @spec unquote(:"#{resource}_delete")(OAuth2.Client.t(), integer()) ::
                  :ok | {:error, Response.t()}
          @doc "Deletes #{resource} resource."
          def unquote(:"#{resource}_delete")(client, id) do
            with {:ok, %Response{body: data}} <-
                   Request.delete(client, "/#{unquote(resource)}/#{id}"),
                 do: :ok
          end
        end

        if :list in actions do
          @spec unquote(:"#{resource}_list")(OAuth2.Client.t()) ::
                  {:ok, list(unquote(struct).t())} | {:error, Response.t()}
          @doc "Fetches all available #{resource} resources."
          def unquote(:"#{resource}_list")(client) do
            with {:ok, %Response{body: %{"results" => data}}} <-
                   Request.get(client, "/#{unquote(resource)}"),
                 do: {:ok, Response.resource(unquote(struct), data)}
          end
        end

        if :partial_update in actions do
          @spec unquote(:"#{resource}_partial_update")(
                  OAuth2.Client.t(),
                  integer(),
                  unquote(struct).partial_update_params
                ) ::
                  {:ok, unquote(struct).t()} | {:error, Response.t()}
          @doc "Updates existing #{resource} resources."
          def unquote(:"#{resource}_partial_update")(client, id, params) do
            with {:ok, %Response{body: data}} <-
                   Request.patch(client, "/#{unquote(resource)}/#{id}", params),
                 do: {:ok, Response.resource(unquote(struct), data)}
          end
        end

        if :read in actions do
          @spec unquote(:"#{resource}_read")(OAuth2.Client.t(), integer()) ::
                  {:ok, unquote(struct).t()} | {:error, Response.t()}
          @doc "Fetches #{resource} resource by ID."
          def unquote(:"#{resource}_read")(client, id) do
            with {:ok, %Response{body: data}} <-
                   Request.get(client, "/#{unquote(resource)}/#{id}"),
                 do: {:ok, Response.resource(unquote(struct), data)}
          end
        end

        if :update in actions do
          @spec unquote(:"#{resource}_update")(
                  OAuth2.Client.t(),
                  integer(),
                  unquote(struct).update_params
                ) ::
                  {:ok, unquote(struct).t()} | {:error, Response.t()}
          @doc "Updates existing #{resource} resources."
          def unquote(:"#{resource}_update")(client, id, params) do
            with {:ok, %Response{body: data}} <-
                   Request.put(client, "/#{unquote(resource)}/#{id}", params),
                 do: {:ok, Response.resource(unquote(struct), data)}
          end
        end
      end
    end
  end
end
