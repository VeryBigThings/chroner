defmodule Chroner.Request do
  @moduledoc false

  alias Chroner.Response

  for method <- ~w(get delete patch post put)a do
    def unquote(method)(client, url, params \\ [], headers \\ []) do
      {status, response} = OAuth2.Client.unquote(method)(client, url, params, headers)
      response = convert_response_struct(response)
      {status, response}
    end
  end

  def upsert_headers do
    [
      {"content-type", "application/x-www-form-urlencoded"},
      {"accept", "application/json"}
    ]
  end

  defp convert_response_struct(struct), do: struct(Response, Map.from_struct(struct))
end
