defmodule ContactManagementSystemWeb.UserView do
  use ContactManagementSystemWeb, :view
  alias ContactManagementSystemWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user, token: token}) do
    %{
      first_name: user.first_name,
      last_name: user.last_name,
      email: user.email,
      token: token
    }
  end
end
