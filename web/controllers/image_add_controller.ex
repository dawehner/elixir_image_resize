defmodule ElixirImageResize.ImageController do
  use ElixirImageResize.Web, :controller
  import Exredis

  def key(uuid) do
    "images:" <> uuid
  end

  def post(conn, %{"url" => url}) do
    # NewUUID = UUID.uuid4()
    newUUID = UUID.uuid4()
    setKey = "images:" <> newUUID

    IO.puts url

    start_link |> elem(1) |> query ["SET", setKey, url]

    json conn, %{:uuid => newUUID}
  end

  def get(conn, %{"uuid" => uuid}) do
    IO.puts uuid

    setKey = "images:" <> uuid

    url = start_link |> elem(1) |> query ["GET", setKey]

    json conn, %{:url => url}
  end

end
