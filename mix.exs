defmodule Ttk4145ElixirTemplate.MixProject do
  use Mix.Project

  def project do
    [
      app: :ttk4145_elixir_template,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Ttk4145ElixirTemplate.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:libcluster, "~> 3.2.2"}
    ]
  end
end
