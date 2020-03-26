defmodule LiveViewCounterWeb.CounterTest do
  use LiveViewCounterWeb.ConnCase
  import Phoenix.LiveViewTest

  test "connected mount", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/")
    assert html =~ "Count: 0"
  end

  test "Increment", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")
    # assert html_response(conn, 200) =~ "The count is"
    assert render_click(view, :inc) =~ "Count: 1"
  end

  test "Decrement", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")
    # assert html_response(conn, 200) =~ "The count is"
    assert render_click(view, :dec) =~ "Count: -1"
  end

  test "handle_info/2", %{conn: conn} do
    {:ok, view, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Count: 0"
    assert render(view) =~ "Count: 0"
    send(view.pid, %{payload: %{ val: 1 }})
    assert render(view) =~ "Count: 1"
  end
end
