# Chroner

This package allows Elixir developers to easily access the Dr.Chrono [API](https://app.drchrono.com/api-docs). Implementation is a thin layer of abstraction over [ouath2](https://github.com/scrogson/oauth2) elixir library which encapsulates REST calls and OAuth mechanism. Currently only available version is `V4`.

Entities are represented with the help of [ecto embedded schemas](https://hexdocs.pm/ecto/Ecto.Schema.html#t:embedded_schema/0) and casted with [ecto morph](https://github.com/Adzz/ecto_morph).

Codebase is split according to API versions (curently just `V4`) and domains: Authorization, Administrative, Clinical, Biling and Practice management contexts.

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
iex(2)> Chroner.users_current(client)
```

## Contribution

You're very welcome to contribute to the project by adding missing endpoints, tests, documentation or even new api versions. If you decide to contribute please evaluate your code with [`make evaluate`](https://github.com/VeryBigThings/chroner/blob/master/Makefile#5) which will make sure that code is: formatted, linted, statically analyzed and tested. Same evalution is being executed on the CI.

Always create a new branch and request a PR from code owner.

All endpoints and API resources are mapped from https://app.drchrono.com/api-docs/ and https://rdecicca.drchrono.com/api-docs-old/v4/documentation#apiappointments. If you want to add new endpoint, find a belonging context and define it there.

All schemas/entites are mapped according to [api schema](https://rdecicca.drchrono.com/openapi-schema).

### Testing

All endpoints need to be tested at one point. Tests are configured using cassettes with [ex_vcr](https://github.com/parroty/exvcr). Due to this decision you need to setup desired state on you Dr.Chrono app before running the test and recording
new cassettes. If you're fixing or modifying existing endpoints/tests, please [delete](https://github.com/parroty/exvcr#mix-vcrdelete-delete-cassettes) desired cassette first and then record your own.

To (re)record new cassettes you must provision an valid [access token](https://app.drchrono.com/api-docs/#section/Authorization) and export it as environment variable under the name of `ACCESS_TOKEN`. Be aware of defining right access token scope for the endpoints you need to test. If not sure what scope to use, use all [available](https://app.drchrono.com/api-docs/#section/Authentication) rights. Also, recorded cassettes don't track `authorization` header by default.

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
mix test
```
or:
```bash
ACCESS_TOKEN=XXXXXXXXXXXXXXXXXXXXXXXXX mix test
```

## Documentation

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/chroner](https://hexdocs.pm/chroner).
