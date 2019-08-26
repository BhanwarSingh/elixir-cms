defmodule ContactManagementSystem.ContactsTest do
  use ContactManagementSystem.DataCase

  alias ContactManagementSystem.Contacts

  describe "contacts" do
    alias ContactManagementSystem.Contacts.Contact

    @valid_attrs %{date_of_birth: ~D[2010-04-17], email: "some email", first_name: "some first_name", last_name: "some last_name", phone_number: 42}
    @update_attrs %{date_of_birth: ~D[2011-05-18], email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", phone_number: 43}
    @invalid_attrs %{date_of_birth: nil, email: nil, first_name: nil, last_name: nil, phone_number: nil}

    def contact_fixture(attrs \\ %{}) do
      {:ok, contact} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Contacts.create_contact()

      contact
    end

    test "list_contacts/0 returns all contacts" do
      contact = contact_fixture()
      assert Contacts.list_contacts() == [contact]
    end

    test "get_contact!/1 returns the contact with given id" do
      contact = contact_fixture()
      assert Contacts.get_contact!(contact.id) == contact
    end

    test "create_contact/1 with valid data creates a contact" do
      assert {:ok, %Contact{} = contact} = Contacts.create_contact(@valid_attrs)
      assert contact.date_of_birth == ~D[2010-04-17]
      assert contact.email == "some email"
      assert contact.first_name == "some first_name"
      assert contact.last_name == "some last_name"
      assert contact.phone_number == 42
    end

    test "create_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contacts.create_contact(@invalid_attrs)
    end

    test "update_contact/2 with valid data updates the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{} = contact} = Contacts.update_contact(contact, @update_attrs)
      assert contact.date_of_birth == ~D[2011-05-18]
      assert contact.email == "some updated email"
      assert contact.first_name == "some updated first_name"
      assert contact.last_name == "some updated last_name"
      assert contact.phone_number == 43
    end

    test "update_contact/2 with invalid data returns error changeset" do
      contact = contact_fixture()
      assert {:error, %Ecto.Changeset{}} = Contacts.update_contact(contact, @invalid_attrs)
      assert contact == Contacts.get_contact!(contact.id)
    end

    test "delete_contact/1 deletes the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{}} = Contacts.delete_contact(contact)
      assert_raise Ecto.NoResultsError, fn -> Contacts.get_contact!(contact.id) end
    end

    test "change_contact/1 returns a contact changeset" do
      contact = contact_fixture()
      assert %Ecto.Changeset{} = Contacts.change_contact(contact)
    end
  end
end
