defmodule Bartender.MixProject do
  use Mix.Project

  def project do
    [
      app: :bartender,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      description: "JWT authentication using Absinthe + Guardian",
      package: package(),
      deps: deps()
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      maintainers: ["Cameron Irmas"],
      links: %{"GitHub" => "https://github.com/camirmas/bartender"},
      source_url: "https://github.com/camirmas/bartender",
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
      {:absinthe_plug, "~> 1.4.0"},
      {:guardian, "~> 1.0.1"},
      {:plug, "~> 1.5.0"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
