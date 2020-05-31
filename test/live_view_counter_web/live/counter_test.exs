defmodule LiveViewCounterWeb.CounterTest do
  use LiveViewCounterWeb.ConnCase
  import Phoenix.LiveViewTest

  test "connected mount", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/")
    assert html =~ "count is: 0"
  end

  test "Increment", %{conn: conn} do
    {:ok, view, html} = live(conn, "/")
    assert html =~ "count is: 0"
    assert render_click(view, :inc) =~ "count is: 1"
  end

  test "Decrement", %{conn: conn} do
    {:ok, view, html} = live(conn, "/")
    assert html =~ "count is: 0"
    assert render_click(view, :dec) =~ "count is: -1"
  end

  test "handle_info/2", %{conn: conn} do
    {:ok, view, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "count is: 0"
    assert render(view) =~ "count is: 0"
    send(view.pid, %{payload: %{ val: 1 }})
    assert render(view) =~ "count is: 1"
  end
end
