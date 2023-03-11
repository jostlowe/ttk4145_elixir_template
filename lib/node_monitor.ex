defmodule NodeMonitor do
  use GenServer, restart: :permanent
  require Logger

  def start_link([]) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    :net_kernel.monitor_nodes(true)
    Logger.info("Node monitor active")
    {:ok, []}
  end

  def handle_info({:nodedown, node}, state) do
    Logger.warn("Node down! : #{inspect(node)}")
    # ===
    # TODO: Insert code that handles node failure here
    # ===
    {:noreply, state}
  end

  def handle_info({:nodeup, node}, state) do
    Logger.info("Node joined! : #{inspect(node)}")
    # ===
    # TODO: Insert code that handles new nodes here
    # ===
    {:noreply, state}
  end
end
