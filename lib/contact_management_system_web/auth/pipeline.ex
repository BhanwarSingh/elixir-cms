defmodule ContactManagementSystemWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :contact_management_system,
    module: ContactManagementSystemWeb.Auth.Guardian,
    error_handler: ContactManagementSystemWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
