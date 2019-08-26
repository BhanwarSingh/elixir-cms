defmodule ContactManagementSystemWeb.Router do
  use ContactManagementSystemWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ContactManagementSystemWeb do
    pipe_through :api
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/", ContactManagementSystemWeb do
    pipe_through :browser
    get "/", DefaultController, :index
  end
end
