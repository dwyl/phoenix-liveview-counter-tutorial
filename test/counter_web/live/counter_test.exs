defmodule CounterWeb.CounterTest do
  use CounterWeb.ConnCase
  import Phoenix.LiveViewTest


  test "connected mount", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/")
    assert html =~ "Counter: 0"
  end

  test "Increment", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")
    assert render_click(view, :inc) =~ "Counter: 1"
  end

  test "Decrement", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")
    assert render_click(view, :dec) =~ "Counter: -1"
  end

  test "handle_info/2 broadcast message", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")
    {:ok, view2, _html} = live(conn, "/")

    assert render_click(view, :inc) =~ "Counter: 1"
    assert render_click(view2, :inc) =~ "Counter: 2"
  end

  # test "handle_info/2 Count Update", %{conn: conn} do
  #   {:ok, view, disconnected_html} = live(conn, "/")
  #   current = LiveViewCounter.Count.current()
  #   assert disconnected_html =~ "Counter: #{current}"
  #   assert render(view) =~ "Counter: #{current}"
  #   send(view.pid, {:count, 2})
  #   assert render(view) =~ "Counter: 2"
  # end

  # test "handle_info/2 Presence Update - Joiner", %{conn: conn} do
  #   {:ok, view, html} = live(conn, "/")
  #   assert html =~ "Current users: 1"
  #   send(view.pid, %{
  #     event: "presence_diff",
  #     payload: %{joins: %{"phx-Fhb_dqdqsOCzKQAl" => %{metas: [%{phx_ref: "Fhb_dqdrwlCmfABl"}]}},
  #                leaves: %{}}})
  #   assert render(view) =~ "Current users: 2"
  # end

  # test "handle_info/2 Presence Update - Leaver", %{conn: conn} do
  #   {:ok, view, html} = live(conn, "/")
  #   assert html =~ "Current users: 1"
  #   send(view.pid, %{
  #     event: "presence_diff",
  #     payload: %{joins: %{},
  #                leaves: %{"phx-Fhb_dqdqsOCzKQAl" => %{metas: [%{phx_ref: "Fhb_dqdrwlCmfABl"}]}}}})
  #   assert render(view) =~ "Current users: 0"
  # end
end
