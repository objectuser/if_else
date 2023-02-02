defmodule IfElse.MixProject do
  use Mix.Project

  def project do
    [
      app: :if_else,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      docs: docs(),
      package: package(),
      name: "IfElse"
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
      {:ex_doc, "~> 0.28", only: :dev, runtime: false}
    ]
  end

  defp description() do
    """
    Conditional logic based on truthy or empty values.
    """
  end

  defp docs do
    [
      main: "IfElse"
    ]
  end

  defp package do
    [
      name: "if_else",
      maintainers: ["objectuser"],
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => "https://github.com/objectuser/if_else"
      },
      source_url: "https://github.com/objectuser/if_else"
    ]
  end
end
