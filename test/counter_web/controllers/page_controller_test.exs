defmodule CounterWeb.PageControllerTest do
  use CounterWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "The count is"
  end
end
