defmodule LiveViewCounterWeb.Counter do
  use Phoenix.LiveView

  @topic "live"

  def mount(_session, _params, socket) do
    LiveViewCounterWeb.Endpoint.subscribe(@topic) # subscribe to the channel
    {:ok, assign(socket, :val, 0)}
  end

  def handle_event("inc", _value, socket) do
    new_state = update(socket, :val, &(&1 + 1))
    LiveViewCounterWeb.Endpoint.broadcast_from(self(), @topic, "inc", new_state.assigns)
    {:noreply, new_state}
  end

  def handle_event("dec", _, socket) do
    new_state = update(socket, :val, &(&1 - 1))
    LiveViewCounterWeb.Endpoint.broadcast_from(self(), @topic, "dec", new_state.assigns)
    {:noreply, new_state}
  end

  def handle_info(msg, socket) do
    {:noreply, assign(socket, msg.payload)}
  end

  def render(assigns) do
    LiveViewCounterWeb.PageView.render("counter.html", assigns)
  end
end
