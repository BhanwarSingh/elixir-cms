defmodule ContactManagementSystemWeb.Router do
  use ContactManagementSystemWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug ContactManagementSystemWeb.Auth.Pipeline
  end

  scope "/api", ContactManagementSystemWeb do
    pipe_through :api

    post "/users/signup", UserController, :create
    post "/users/signin", UserController, :signin
  end

  scope "/api", ContactManagementSystemWeb do
    pipe_through [:api, :auth]

    resources "/contacts", ContactController
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/", ContactManagementSystemWeb do
    pipe_through :browser
    
    get "/", DefaultController, :index
  end
end
