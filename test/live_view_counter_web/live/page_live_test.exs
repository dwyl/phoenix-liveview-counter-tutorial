defmodule LiveViewCounterWeb.PageLiveTest do
  use LiveViewCounterWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "The count is"
    assert render(page_live) =~ "The count is"
  end
end
