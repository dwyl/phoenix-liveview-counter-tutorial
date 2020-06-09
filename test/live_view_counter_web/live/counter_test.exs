defmodule LiveViewCounterWeb.CounterTest do
  use LiveViewCounterWeb.ConnCase
  import Phoenix.LiveViewTest

  test "connected mount", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/")
    current = LiveViewCounter.Count.current()
    assert html =~ "count is: #{current}"
  end

  test "Increment", %{conn: conn} do
    {:ok, view, html} = live(conn, "/")
    current = LiveViewCounter.Count.current()
    assert html =~ "count is: #{current}"
    assert render_click(view, :inc) =~ "count is: #{current + 1}"
  end

  test "Decrement", %{conn: conn} do
    {:ok, view, html} = live(conn, "/")
    current = LiveViewCounter.Count.current()
    assert html =~ "count is: #{current}"
    assert render_click(view, :dec) =~ "count is: #{current - 1}"
  end

  test "handle_info/2", %{conn: conn} do
    {:ok, view, disconnected_html} = live(conn, "/")
    current = LiveViewCounter.Count.current()
    assert disconnected_html =~ "count is: #{current}"
    assert render(view) =~ "count is: #{current}"
    send(view.pid, {:count, 2})
    assert render(view) =~ "count is: 2"
  end
end
