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

  test "handle_info/2", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")
    assert view.module == LiveViewCounterWeb.Counter
    msg = %{payload: %{ val: 1 }}
    result = send(view.pid, msg)
    assert result == msg

  end
  # test "handle_info/2", %{conn: conn} do
  #   msg = %{payload: %{ val: 1 }}
  #   {:noreply, result} = LiveViewCounterWeb.Counter.handle_info(msg, conn)
  #   # IO.inspect(result, label: "result")
  #   assert result == %{val: 1}
  # end
end
