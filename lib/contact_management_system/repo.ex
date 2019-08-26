defmodule ContactManagementSystem.Repo do
  use Ecto.Repo,
    otp_app: :contact_management_system,
    adapter: Ecto.Adapters.Postgres
end
