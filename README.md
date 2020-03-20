# Chroner

This package allows Elixir developers to easily access the Dr.Chrono [API](https://app.drchrono.com/api-docs). Implementation is a thin layer of abstraction over [ouath2](https://github.com/scrogson/oauth2) elixir library which encapsulates REST calls and OAuth mechanism.

Entities are represented with the help of [ecto embedded schemas](https://hexdocs.pm/ecto/Ecto.Schema.html#t:embedded_schema/0) and casted with [ecto morph](https://github.com/Adzz/ecto_morph).

Codebase is split according to API domains to: Authorization, Administrative, Clinical, Biling and Practice management contexts.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `chroner` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:chroner, "~> 0.1.0"}
  ]
end
```

## Usage

You can configure your chroner client by providing `access_token` to consume Dr.Chrono API.

```elixir
iex(1)> client = Chroner.client(access_token: System.get_env("ACCESS_TOKEN"))
%OAuth2.Client{
  authorize_url: "https://drchrono.com/o/authorize",
  client_id: "",
  client_secret: "",
  headers: [],
  params: %{},
  redirect_uri: "",
  ref: nil,
  request_opts: [follow_redirect: true],
  serializers: %{"application/json" => Poison},
  site: "https://app.drchrono.com/api",
  strategy: Chroner.Authorization,
  token: %OAuth2.AccessToken{
    access_token: ***,
    expires_at: nil,
    other_params: %{},
    refresh_token: nil,
    token_type: "Bearer"
  },
  token_method: :post,
  token_url: "https://drchrono.com/o/token/"
}
iex(2)> Chroner.users_current(client)
{:ok,
 %Chroner.Administrative.User{
   doctor: ***,
   id: ***,
   is_doctor: true,
   is_staff: false,
   permissions: %Chroner.Administrative.Permissions{
     access_all_messages_for_practice_group: false,
     "access_balance/ledger": false,
     access_billing: true,
     access_clinical_notes: true,
     access_institutional_billing: true,
     access_patient_analytics: true,
     access_patient_payments: false,
     access_patient_statements: false,
     access_reports: true,
     access_scheduling: true,
     access_to_erx: true,
     access_to_message_center: true,
     add_new_referring_sources: false,
     appointment_provider_selection: true,
     billing_administrator: false,
     create_and_update_contacts: true,
     create_and_update_patients: true,
     drug_interactions_check: true,
     emergency_access: true,
     export_patients: true,
     manage_accounts: true,
     manage_permissions: true,
     manage_templates: true,
     provider_dropdown: false,
     settings: true,
     share_patients: false,
     show_billing_summary: true,
     show_billing_tab: true,
     show_patient_balance: true,
     "sign/lock_clinical_notes": true,
     use_ipad_ehr: true,
     view_practice_group: true
   },
   practice_group: 279966,
   username: ***
 }}
```

If you want to use authorization layer of the chroner you can configure it with `client_id`, `client_secret` and `redirect_uri`. After that you can request authorization url and access token as a part of [OAuth2](https://oauth.net/2/) flow.

```elixir
iex(1)> config = [client_id: System.get_env("CLIENT_ID"), client_secret: System.get_env("CLIENT_SECRET"), redirect_uri: System.get_env("REDIRECT_URI")]
iex(2)> client = Chroner.client(config)
%OAuth2.Client{
  authorize_url: "https://drchrono.com/o/authorize",
  client_id: ***,
  client_secret: ***,
  headers: [],
  params: %{},
  redirect_uri: ***,
  ref: nil,
  request_opts: [follow_redirect: true],
  serializers: %{"application/json" => Poison},
  site: "https://app.drchrono.com/api",
  strategy: Chroner.Authorization,
  token: %OAuth2.AccessToken{
    expires_at: nil,
    other_params: %{},
    access_token: nil,
    refresh_token: nil,
    token_type: "Bearer"
  },
  token_method: :post,
  token_url: "https://drchrono.com/o/token/"
}
iex(3)> Chroner.authorize_url!(client, "patients:read")
"https://drchrono.com/o/authorize?client_id=***&redirect_uri=localhost%3A4000&response_type=code&scope=patients%3Aread"
```

When you retrive `code` along with other params after the OAuth screen you can invoke `get_token!` with you client.

```elixir
iex(1)> Chroner.get_token!(client, params)
%OAuth2.Client{
  authorize_url: "https://drchrono.com/o/authorize",
  client_id: ***,
  client_secret: ***,
  headers: [],
  params: %{},
  redirect_uri: ***,
  ref: nil,
  request_opts: [follow_redirect: true],
  serializers: %{"application/json" => Poison},
  site: "https://app.drchrono.com/api",
  strategy: Chroner.Authorization,
  token: %OAuth2.AccessToken{
    expires_at: nil,
    other_params: %{},
    access_token: ***,
    refresh_token: nil,
    token_type: "Bearer"
  },
  token_method: :post,
  token_url: "https://drchrono.com/o/token/"
}
```

## Contribution

You're very welcome to contribute to the project by adding missing endpoints, tests or documentation. If you decide to contribute please evaluate your code with [`make evaluate`](https://github.com/VeryBigThings/chroner/blob/master/Makefile#5) which will make sure that code is: formatted, linted, statically analyzed and tested. Same evalution is being executed on the CI.

Always create a new branch and request a PR from code owner.

All endpoints and API resources are mapped from (official documentation)[https://app.drchrono.com/api-docs/]. If you want to add new endpoint, find a belonging context and define it there.

### Testing

All endpoints need to be tested at one point. Tests are configured using cassettes with [ex_vcr](https://github.com/parroty/exvcr). Due to this decision you need to setup desired state on you Dr.Chrono app before running the test and recording
new cassettes. If you're fixing or modifying existing endpoints/tests, please [delete](https://github.com/parroty/exvcr#mix-vcrdelete-delete-cassettes) desired cassette first and then record your own.

To (re)record new cassettes you must provision an valid [access token](https://app.drchrono.com/api-docs/#section/Authorization) and export it as environment variable under the name of `ACCESS_TOKEN`. Be aware of defining right access token scope for the endpoints you need to test. If not sure what scope to use, use all [available](https://app.drchrono.com/api-docs/#section/Authentication) rights.

Scopes:
```
billing:patient-payment:write
billing:patient-payment:read
billing:read
billing:write
calendar:read
calendar:write
clinical:read
clinical:write
labs:read
labs:write
messages:read
messages:write
patients:read
patients:summary:read
patients:summary:write
patients:write
settings:read
settings:write
tasks:read
tasks:write
user:read
user:write
```

Exporting token:
```bash
export ACCESS_TOKEN=XXXXXXXXXXXXXXXXXXXXXXXXX
```

Running tests:
```bash
make evaluate
```

## Documentation

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/chroner](https://hexdocs.pm/chroner).
