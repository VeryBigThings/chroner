defmodule Chroner.Support.APICase do
  @moduledoc """
  ExUnit case used for setting up clients used in API call tests.
  """

  use ExUnit.CaseTemplate

  using opts do
    api_version = Keyword.get(opts, :api_version, "V4")

    quote do
      use ExUnit.Case, async: true
      use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

      import unquote(Module.concat(Chroner, api_version)).{Administrative, Clinical}

      alias unquote(Module.concat(Chroner, api_version)).Administrative.{Doctor, User}
      alias unquote(Module.concat(Chroner, api_version)).Clinical.{AppointmentProfile, Patient}
      alias OAuth2.Response
    end
  end

  setup do
    valid_client = Chroner.client(access_token: System.get_env("ACCESS_TOKEN"))
    invalid_client = Chroner.client(access_token: "INVALID_TOKEN")
    {:ok, %{valid_client: valid_client, invalid_client: invalid_client}}
  end
end
