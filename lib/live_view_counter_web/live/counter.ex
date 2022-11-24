defmodule LiveViewCounterWeb.Counter do
  use LiveViewCounterWeb, :live_view
  alias LiveViewCounter.Count
  alias Phoenix.PubSub
  alias LiveViewCounter.Presence

  @topic Count.topic
  @presence_topic "presence"


  def mount(_params, _session, socket) do
    PubSub.subscribe(LiveViewCounter.PubSub, @topic)

    Presence.track(self(), @presence_topic, socket.id, %{})

    initial_present =
      Presence.list(@presence_topic)
      |> map_size

      LiveViewCounterWeb.Endpoint.subscribe(@presence_topic)


    {:ok, assign(socket, val:  Count.current(), present: initial_present) }
  end


  def handle_event("inc", _, socket) do
    {:noreply, assign(socket, val: Count.incr())}
  end

  def handle_event("dec", _, socket) do
    {:noreply, assign(socket, val: Count.decr())}
  end

  def handle_info({:count, count}, socket) do
    {:noreply, assign(socket, val: count)}
  end

  def handle_info(
       %{event: "presence_diff", payload: %{joins: joins, leaves: leaves}},
       %{assigns: %{present: present}} = socket
    ) do
   new_present = present + map_size(joins) - map_size(leaves)


   {:noreply, assign(socket, :present, new_present)}
   end



  def render(assigns) do
    ~H"""
    <div>
    <h1 class="text-4xl font-bold text-center"> The count is: <%= @val %> </h1>

    <p class="text-center">
     <.button phx-click="dec">-</.button>
     <.button phx-click="inc">+</.button>
     </p>

     <h1 class="text-4xl font-bold text-center"> Current users: <%= @present %></h1>
     </div>
    """
  end
end
