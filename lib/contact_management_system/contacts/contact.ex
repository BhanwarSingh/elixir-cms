defmodule ContactManagementSystem.Contacts.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contacts" do
    belongs_to :user, ContactManagementSystem.Accounts.User

    field :date_of_birth, :date
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :phone_number, :string

    timestamps()
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:first_name, :last_name, :phone_number, :date_of_birth, :email, :user_id])
    |> validate_required([:first_name, :last_name, :phone_number, :date_of_birth, :email, :user_id])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/^[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/)
    |> validate_minimum_age(:date_of_birth)
    |> validate_maximum_age(:date_of_birth)
    |> validate_length(:phone_number, min: 10, max: 15)
    |> validate_phone_number(:phone_number)
  end

  defp validate_minimum_age(%Ecto.Changeset{} = changeset, field, opts \\ [])
      when is_atom(field) do
    min_age = opts[:mininum_age] || 12

    validate_change(changeset, field, fn _, %Date{} = date_of_birth ->
      date_of_birth = date_of_birth |> Date.to_erl() |> Timex.to_date()

      cond do
        Timex.before?(Date.utc_today(), date_of_birth) ->
          msg = opts[:message_future] || "cannot be in the future"
          [{field, msg}]

        Timex.before?(Timex.shift(Date.utc_today(), years: -min_age), date_of_birth) ->
          msg =
            opts[:message_over] || opts[:message] ||
              {"must be over %{age} years old", age: min_age}

          [{field, msg}]

        true ->
          []
      end
    end)
  end

  defp validate_maximum_age(%Ecto.Changeset{} = changeset, field, opts \\ [])
      when is_atom(field) do
    max_age = opts[:maximum_age] || 120

    validate_change(changeset, field, fn _, %Date{} = date_of_birth ->
      date_of_birth = date_of_birth |> Date.to_erl() |> Timex.to_date()

      if Timex.after?(Timex.shift(Date.utc_today(), years: -max_age), date_of_birth) do
        msg =
          opts[:message_under] || opts[:message] ||
            {"must be under %{age} years old", age: max_age}

        [{field, msg}]
      else
        []
      end
    end)
  end

  def validate_phone_number(changeset, field, opts \\ []) do
    pattern = ~r/\A[\d#\+\-\.\(\)x ]+\z/

    validate_change(changeset, field, fn _, number ->
      if number =~ pattern do
        []
      else
        msg = opts[:message] || "must be a valid phone number"
        [{field, msg}]
      end
    end)
  end
end
