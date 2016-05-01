defmodule ElixirImageResize.PageController do
  use ElixirImageResize.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
