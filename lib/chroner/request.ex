defmodule Chroner.Request do
  @moduledoc false

  alias Chroner.Response

  for method <- ~w(get delete patch post put)a do
    def unquote(method)(client, url, params \\ []) do
      {status, response} = OAuth2.Client.unquote(method)(client, url, params)
      response = convert_response_struct(response)
      {status, response}
    end
  end

  defp convert_response_struct(struct), do: struct(Response, Map.from_struct(struct))
end
