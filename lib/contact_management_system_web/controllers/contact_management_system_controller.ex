defmodule ContactManagementSystemWeb.DefaultController do
  use ContactManagementSystemWeb, :controller

  def index(conn, _params) do
    text conn, "ContactManagementSystem!"
  end
end