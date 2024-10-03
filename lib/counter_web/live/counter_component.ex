defmodule CounterComponent do
  use Phoenix.LiveComponent

  # Avoid duplicating the Tailwind Classes and show hot to inline a function call:
  defp btn(color) do
    "text-6xl pb-2 w-20 rounded-lg bg-#{color}-500 hover:bg-#{color}-600"
  end

  def render(assigns) do
    ~H"""
    <div class="text-center">
      <h1 class="text-4xl font-bold text-center">Counter: <%= @val %></h1>
      <button phx-click="dec" class={btn("red")}>
        -
      </button>
      <button phx-click="inc" class={btn("green")}>
        +
      </button>
    </div>
    """
  end
end
