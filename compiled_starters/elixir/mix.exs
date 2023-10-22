defmodule App.MixProject do
  # NOTE: You do not need to change anything in this file.
  use Mix.Project

  def project do
    [
      app: :bittorrent,
      version: "1.0.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Bittorrent.Application, []}
    ]
  end
  
  defp deps do
    [
      {:jason, "~> 1.2"},
#      {:bento, "~> 1.0"},
    ]
  end
end