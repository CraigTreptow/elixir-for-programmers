defmodule TextClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :text_client,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      included_applications: [:hangman], # included, but not started automatically
      extra_applications:    [:logger ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      { :hangman, path: "../hangman"},
      { :credo, "~> 0.10.0", only: [:dev, :test], runtime: false },
    ]
  end
end
