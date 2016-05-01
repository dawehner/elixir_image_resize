defmodule ElixirImageResize.Router do
  use ElixirImageResize.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/", ElixirImageResize do
  #  pipe_through :browser # Use the default browser stack

  #  get "/", PageController, :index
  #  post "/image/add", ImageAddController, :post
  # end

  scope "/", ElixirImageResize do
    pipe_through :api

    post "/image", ImageController, :post
    get "/image/:uuid", ImageController, :get
  end

end
