defmodule Chroner.MixProject do
  use Mix.Project

  def project do
    [
      app: :chroner,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer(),

      # Docs
      name: "Chroner",
      source_url: "https://github.com/verybigthings/chroner",
      docs: [
        main: "Chroner",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dialyxir, "~> 0.5", runtime: false},
      {:ecto, "~> 3.3"},
      {:ecto_morph, "~> 0.1.13"},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:oauth2, "~> 2.0"},
      {:poison, "~> 3.1"}
    ]
  end

  defp dialyzer() do
    [
      plt_add_apps: [:ex_unit, :mix],
      ignore_warnings: "dialyzer.ignore-warnings"
    ]
  end
end
