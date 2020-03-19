defmodule Chroner.Authorization do
  use OAuth2.Strategy

  alias OAuth2.{AccessToken, Client}

  @type config :: %{
          optional(:client_id) => String.t(),
          optional(:client_secret) => String.t(),
          optional(:redirect_uri) => String.t(),
          optional(:token) => String.t()
        }

  # --------------------------------------------------------------------
  # Client
  # --------------------------------------------------------------------

  @spec client(config) :: Client.t()
  def client(config \\ %{}) do
    token =
      with token when is_binary(token) <- Map.get(config, :token),
           do: AccessToken.new(token)

    Client.new(
      authorize_url: "https://drchrono.com/o/authorize",
      client_id: Map.get(config, :client_id),
      client_secret: Map.get(config, :client_secret),
      redirect_uri: Map.get(config, :redirect_uri),
      request_opts: [follow_redirect: true],
      serializers: %{"application/json" => Poison},
      site: "https://app.drchrono.com/api",
      strategy: __MODULE__,
      token: token,
      token_url: "https://drchrono.com/o/token/"
    )
  end

  # --------------------------------------------------------------------
  # API
  # --------------------------------------------------------------------

  def authorize_url!(client, scope), do: Client.authorize_url!(client, scope: scope)

  def get_token!(client, params \\ [], headers \\ [], opts \\ []),
    do: Client.get_token!(client, params, headers, opts)

  # --------------------------------------------------------------------
  # Strategy callbacks
  # --------------------------------------------------------------------

  @impl OAuth2.Strategy
  def authorize_url(client, params), do: OAuth2.Strategy.AuthCode.authorize_url(client, params)

  @impl OAuth2.Strategy
  def get_token(client, params, headers) do
    client
    |> put_param(:client_secret, client.client_secret)
    |> OAuth2.Strategy.AuthCode.get_token(params, headers)
  end
end
