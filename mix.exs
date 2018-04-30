defmodule Bartender.MixProject do
  use Mix.Project

  def project do
    [
      app: :bartender,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:plug, "~> 1.5.0"}
    ]
  end
end
