defmodule Chroner.Support.ClientCase do
  @moduledoc """
  ExUnit case used for setting up clients used in API call tests.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      use ExUnit.Case, async: true
      use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

      alias OAuth2.Response
    end
  end

  setup do
    valid_client = Chroner.client(access_token: System.get_env("ACCESS_TOKEN"))
    invalid_client = Chroner.client(access_token: "INVALID_TOKEN")
    {:ok, %{valid_client: valid_client, invalid_client: invalid_client}}
  end
end
