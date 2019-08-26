defmodule ContactManagementSystemWeb.ContactControllerTest do
  use ContactManagementSystemWeb.ConnCase

  alias ContactManagementSystem.Contacts
  alias ContactManagementSystem.Contacts.Contact

  @create_attrs %{
    date_of_birth: ~D[2010-04-17],
    email: "some email",
    first_name: "some first_name",
    last_name: "some last_name",
    phone_number: 42
  }
  @update_attrs %{
    date_of_birth: ~D[2011-05-18],
    email: "some updated email",
    first_name: "some updated first_name",
    last_name: "some updated last_name",
    phone_number: 43
  }
  @invalid_attrs %{date_of_birth: nil, email: nil, first_name: nil, last_name: nil, phone_number: nil}

  def fixture(:contact) do
    {:ok, contact} = Contacts.create_contact(@create_attrs)
    contact
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all contacts", %{conn: conn} do
      conn = get(conn, Routes.contact_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create contact" do
    test "renders contact when data is valid", %{conn: conn} do
      conn = post(conn, Routes.contact_path(conn, :create), contact: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.contact_path(conn, :show, id))

      assert %{
               "id" => id,
               "date_of_birth" => "2010-04-17",
               "email" => "some email",
               "first_name" => "some first_name",
               "last_name" => "some last_name",
               "phone_number" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.contact_path(conn, :create), contact: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update contact" do
    setup [:create_contact]

    test "renders contact when data is valid", %{conn: conn, contact: %Contact{id: id} = contact} do
      conn = put(conn, Routes.contact_path(conn, :update, contact), contact: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.contact_path(conn, :show, id))

      assert %{
               "id" => id,
               "date_of_birth" => "2011-05-18",
               "email" => "some updated email",
               "first_name" => "some updated first_name",
               "last_name" => "some updated last_name",
               "phone_number" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, contact: contact} do
      conn = put(conn, Routes.contact_path(conn, :update, contact), contact: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete contact" do
    setup [:create_contact]

    test "deletes chosen contact", %{conn: conn, contact: contact} do
      conn = delete(conn, Routes.contact_path(conn, :delete, contact))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.contact_path(conn, :show, contact))
      end
    end
  end

  defp create_contact(_) do
    contact = fixture(:contact)
    {:ok, contact: contact}
  end
end
