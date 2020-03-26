defmodule Chronex.MixProject do
  use Mix.Project

  def project do
    [
      app: :chronex,
      version: "0.1.0",
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer(),

      # Docs
      name: "Chronex",
      source_url: "https://github.com/verybigthings/chronex",
      docs: [
        main: "Chronex",
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
      {:credo, "~> 1.3", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 0.5", runtime: false},
      {:ecto, "~> 3.3"},
      {:ecto_morph, "~> 0.1.13"},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:exvcr, "~> 0.11", only: [:dev, :test], runtime: false},
      {:oauth2, "~> 2.0"},
      {:poison, "~> 3.1"}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp dialyzer() do
    [
      plt_add_apps: [:ex_unit, :mix],
      ignore_warnings: "dialyzer.ignore-warnings"
    ]
  end
end
