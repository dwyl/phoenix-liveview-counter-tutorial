defmodule LiveViewCounterWeb.CounterLive do
  use Phoenix.LiveView

  @topic "live"

  def render(assigns) do
    ~L"""
    <div>
      <h1>The count is: <%= @val %></h1>
      <button phx-click="dec">-</button>
      <button phx-click="inc">+</button>
    </div>
    """
  end

  def mount(_session, socket) do
    LiveViewCounterWeb.Endpoint.subscribe(@topic)
    IO.inspect(socket, label: "mount")
    {:ok, assign(socket, :val, 0)}
  end

  def handle_event("inc", _, socket) do
    # IO.inspect(socket, label: "inc")
    # IO.inspect(update(socket, :val, &(&1 + 1)), label: "update")
    # broadcast(socket, "shout", Map.put_new(payload, :id, msg.id))

    # LiveViewCounterWeb.Endpoint.broadcast_from(self(), @topic, "totes", {:val, &(&1 + 1)} )
    {:noreply, update(socket, :val, &(&1 + 1))}
  end

  def handle_event("dec", _, socket) do
    IO.inspect(socket, label: "dec")
    {:noreply, update(socket, :val, &(&1 - 1))}
  end
end
