defmodule LiveViewCounterWeb.CounterTest do
  use LiveViewCounterWeb.ConnCase
  import Phoenix.LiveViewTest
  # @endpoint MyEndpoint

  test "connected mount", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/")
    assert html =~ "The count is"
  end

  test "Increment", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")
    # assert html_response(conn, 200) =~ "The count is"
    assert render_click(view, :inc) =~ "The count is: 1"
  end

  test "Decrement", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")
    # assert html_response(conn, 200) =~ "The count is"
    assert render_click(view, :dec) =~ "The count is: -1"
  end
end
