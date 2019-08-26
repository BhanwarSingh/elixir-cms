defmodule ContactManagementSystemWeb.EmailView do
  use ContactManagementSystemWeb, :view

  def render("new_contact_added.html", %{contact: contact}) do
    "Hi All, we have a new contact added in our database #{contact.email}."
  end
end
