defmodule Bali.MixProject do
  use Mix.Project

  def project do
    [
      app: :bali,
      version: "0.4.1",
      description: "Validate personal and tax identifiers for mx, co, es, pt, it, br",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      aliases: aliases()
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
      {:ex_doc, "~> 0.22.2", only: :dev}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Iván Álvarez"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/resuelve/bali"}
    ]
  end

  defp aliases do
    [
      ci: ["format --check-formatted", "xref unreachable --abort-if-any", "test --cover"]
    ]
  end
end
