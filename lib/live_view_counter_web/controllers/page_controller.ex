defmodule LiveViewCounterWeb.PageController do
  use LiveViewCounterWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
