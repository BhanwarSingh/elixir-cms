defmodule ContactManagementSystemWeb.Email do
  use Bamboo.Phoenix, view: ContactManagementSystemWeb.EmailView

  def new_contact_added(email_address, contact) do
    base_email()
    |> to(email_address)
    |> subject("New Contact Added!")
    |> render("new_contact_added.html", contact: contact)
  end

  def base_email, do: common_base()

  defp common_base do
    from_addr = Application.get_env(:contact_management_system, :default_mail_sender) || "example@gmail.com"

    new_email()
    |> from(from_addr)
  end
end
