defmodule ContactManagementSystemWeb.ContactView do
  use ContactManagementSystemWeb, :view
  alias ContactManagementSystemWeb.ContactView

  def render("index.json", %{contacts: contacts}) do
    %{data: render_many(contacts, ContactView, "contact.json")}
  end

  def render("show.json", %{contact: contact}) do
    %{data: render_one(contact, ContactView, "contact.json")}
  end

  def render("contact.json", %{contact: contact}) do
    %{id: contact.id,
      first_name: contact.first_name,
      last_name: contact.last_name,
      phone_number: contact.phone_number,
      date_of_birth: contact.date_of_birth,
      email: contact.email}
  end
end
