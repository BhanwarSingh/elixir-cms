defmodule ContactManagementSystem.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :first_name, :string
      add :last_name, :string
      add :phone_number, :string
      add :date_of_birth, :date
      add :email, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:contacts, [:email])
    create index(:contacts, [:user_id])
  end
end
