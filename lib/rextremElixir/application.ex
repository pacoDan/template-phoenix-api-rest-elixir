defmodule RextremElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RextremElixirWeb.Telemetry,
      RextremElixir.Repo,
      {DNSCluster, query: Application.get_env(:rextremElixir, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: RextremElixir.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: RextremElixir.Finch},
      # Start a worker by calling: RextremElixir.Worker.start_link(arg)
      # {RextremElixir.Worker, arg},
      # Start to serve requests, typically the last entry
      RextremElixirWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RextremElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RextremElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
