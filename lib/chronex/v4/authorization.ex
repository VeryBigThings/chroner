defmodule Chronex.V4.Authorization do
  @moduledoc "Authorization"

  use OAuth2.Strategy

  alias OAuth2.{AccessToken, Client, Error, Strategy}

  @type config :: [
          client_id: String.t(),
          client_secret: String.t(),
          redirect_uri: String.t(),
          token: String.t()
        ]

  # --------------------------------------------------------------------
  # Client
  # --------------------------------------------------------------------

  @spec client(config) :: Client.t()
  def client(config \\ []) do
    token =
      with access_token when not is_nil(access_token) <- Keyword.get(config, :access_token),
           do: AccessToken.new(access_token)

    Client.new(
      authorize_url: "https://drchrono.com/o/authorize",
      client_id: Keyword.get(config, :client_id, ""),
      client_secret: Keyword.get(config, :client_secret, ""),
      redirect_uri: Keyword.get(config, :redirect_uri, ""),
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

  @spec authorize_url!(Client.t(), String.t()) :: binary()
  def authorize_url!(client, scope), do: Client.authorize_url!(client, scope: scope)

  @spec get_token!(Client.t(), map()) :: Client.t() | Error.t()
  def get_token!(client, params \\ %{}),
    do: Client.get_token!(client, params)

  # --------------------------------------------------------------------
  # Strategy callbacks
  # --------------------------------------------------------------------

  @impl Strategy
  def authorize_url(client, params), do: Strategy.AuthCode.authorize_url(client, params)

  @impl Strategy
  def get_token(client, params, headers) do
    client
    |> put_param(:client_secret, client.client_secret)
    |> Strategy.AuthCode.get_token(params, headers)
  end
end
