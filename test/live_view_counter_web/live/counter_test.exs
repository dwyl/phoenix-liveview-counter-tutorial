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

  test "handle_info/2 Count Update", %{conn: conn} do
    {:ok, view, disconnected_html} = live(conn, "/")
    current = LiveViewCounter.Count.current()
    assert disconnected_html =~ "count is: #{current}"
    assert render(view) =~ "count is: #{current}"
    send(view.pid, {:count, 2})
    assert render(view) =~ "count is: 2"
  end

  test "handle_info/2 Presence Update - Joiner", %{conn: conn} do
    {:ok, view, html} = live(conn, "/")
    assert html =~ "Current users: 1"
    send(view.pid, %{
      event: "presence_diff",
      payload: %{joins: %{"phx-Fhb_dqdqsOCzKQAl" => %{metas: [%{phx_ref: "Fhb_dqdrwlCmfABl"}]}},
                 leaves: %{}}})
    assert render(view) =~ "Current users: 2"
  end

  test "handle_info/2 Presence Update - Leaver", %{conn: conn} do
    {:ok, view, html} = live(conn, "/")
    assert html =~ "Current users: 1"
    send(view.pid, %{
      event: "presence_diff",
      payload: %{joins: %{},
                 leaves: %{"phx-Fhb_dqdqsOCzKQAl" => %{metas: [%{phx_ref: "Fhb_dqdrwlCmfABl"}]}}}})
    assert render(view) =~ "Current users: 0"
  end
end

