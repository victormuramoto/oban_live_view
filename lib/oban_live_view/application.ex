defmodule ObanLiveView.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ObanLiveViewWeb.Telemetry,
      # Start the Ecto repository
      ObanLiveView.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ObanLiveView.PubSub},
      # Start Finch
      {Finch, name: ObanLiveView.Finch},
      # Start the Endpoint (http/https)
      ObanLiveViewWeb.Endpoint,
      # Start a worker by calling: ObanLiveView.Worker.start_link(arg)
      # {ObanLiveView.Worker, arg}
      #Start Oban
      {Oban, repo: ObanLiveView.Repo}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ObanLiveView.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ObanLiveViewWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
