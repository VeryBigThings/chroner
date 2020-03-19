defmodule Chroner.Request do
  @moduledoc false

  alias Chroner.Response

  for method <- ~w(get delete patch post put)a do
    def unquote(method)(client, url, params \\ [], headers \\ []) do
      {status, response} = OAuth2.Client.unquote(method)(client, url, params, headers)
      {status, Response.resource(Response, response)}
    end
  end

  def upsert_headers do
    [
      {"content-type", "application/x-www-form-urlencoded"},
      {"accept", "application/json"}
    ]
  end
end
