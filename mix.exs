defmodule Tipalti.MixProject do
  use Mix.Project

  @version "0.5.0"

  def project do
    [
      app: :tipalti,
      source_url: "https://github.com/peek-travel/tipalti-elixir",
      version: @version,
      elixir: "~> 1.6",
      description: description(),
      package: package(),
      deps: deps(),
      docs: docs(),
      dialyzer: [
        ignore_warnings: ".dialyzer_ignore.exs",
        flags: [:unmatched_returns, :error_handling, :underspecs]
      ],
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
        "coveralls.json": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    """
    Tipalti integration library for Elixir, including Payee and Payer SOAP API clients and iFrame integration helpers.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE.md"],
      maintainers: ["Chris Dosé"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/peek-travel/tipalti-elixir",
        "Readme" => "https://github.com/peek-travel/tipalti-elixir/blob/#{@version}/README.md",
        "Changelog" => "https://github.com/peek-travel/tipalti-elixir/blob/#{@version}/CHANGELOG.md"
      }
    ]
  end

  defp docs do
    [
      main: "Tipalti",
      source_ref: @version,
      source_url: "https://github.com/peek-travel/tipalti-elixir",
      extras: ["README.md", "LICENSE.md"],
      groups_for_modules: [
        API: [Tipalti.API.Payee, Tipalti.API.Payer],
        IFrames: [Tipalti.IFrame.InvoiceHistory, Tipalti.IFrame.PaymentsHistory, Tipalti.IFrame.SetupProcess],
        "Data types": [
          Tipalti.Balance,
          Tipalti.ClientError,
          Tipalti.CustomField,
          Tipalti.Invoice,
          Tipalti.Invoice.Line,
          Tipalti.Invoice.Approver,
          Tipalti.PayeeExtended,
          Tipalti.PayeeExtended.Properties,
          Tipalti.Payee,
          Tipalti.RequestError
        ]
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0.0-rc.3", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:ex_money, "~> 2.6"},
      {:excoveralls, "~> 0.7", only: :test},
      {:hackney, "~> 1.11"},
      {:inch_ex, ">= 0.0.0", only: :docs},
      {:inflex, "~> 1.10"},
      {:tesla, "~> 1.0"},
      {:xml_builder, "~> 2.1"}
    ]
  end
end
