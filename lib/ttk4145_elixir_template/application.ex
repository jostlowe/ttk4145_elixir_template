defmodule Ttk4145ElixirTemplate.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    topologies = [
      gossip: [
        strategy: Elixir.Cluster.Strategy.Gossip,
        config: [
          port: 45892,
          if_addr: "0.0.0.0",
          multicast_addr: "255.255.255.255",
          broadcast_only: true
        ]
      ]
    ]

    children = [
      NodeMonitor,
      {Driver, address: {127, 0, 0, 1}, port: 15657},
      {Cluster.Supervisor, [topologies, [name: TTK4145Elevator.ClusterSupervisor]]}
      # ===
      # TODO: Insert other processes here:
      # ===
    ]

    opts = [strategy: :one_for_one, name: Ttk4145ElixirTemplate.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
