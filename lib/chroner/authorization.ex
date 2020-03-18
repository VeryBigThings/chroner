defmodule Chroner.Authorization do
  use OAuth2.Strategy

  alias OAuth2.{AccessToken, Client}
  alias Chroner.Config

  # --------------------------------------------------------------------
  # Client
  # --------------------------------------------------------------------

  def client(opts \\ []) do
    token = if opts[:access_token], do: AccessToken.new(opts[:access_token])

    Client.new(
      authorize_url: "https://drchrono.com/o/authorize",
      client_id: opts[:config][:client_id] || Config.client_id(),
      client_secret: opts[:config][:client_secret] || Config.client_secret(),
      redirect_uri: opts[:config][:redirect_uri] || Config.redirect_uri(),
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

  def authorize_url!(scope), do: OAuth2.Client.authorize_url!(client(), scope: scope)

  def get_token!(params \\ [], headers \\ [], opts \\ []),
    do: OAuth2.Client.get_token!(client(), params, headers, opts)

  # --------------------------------------------------------------------
  # Strategy callbacks
  # --------------------------------------------------------------------

  def authorize_url(client, params), do: OAuth2.Strategy.AuthCode.authorize_url(client, params)

  def get_token(client, params, headers) do
    client
    |> put_param(:client_secret, client.client_secret)
    |> OAuth2.Strategy.AuthCode.get_token(params, headers)
  end
end
