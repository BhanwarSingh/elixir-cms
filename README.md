# ContactManagementSystem

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

Some API are included:

  * POST - /api/users/signup
    * body_params:
      %{
        "user" => %{
          "email" => "xxxxx",
          "first_name" => "xxxxx",
          "last_name" => "xxxxx",
          "password" => "xxxxx",
          "password_confirmation" => "xxxxx"
        }
      }

    * responce:
      {
        "email": "xxxxx",
        "first_name": "xxxxx",
        "last_name": "xxxxx",
        "token": "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.......xxxxx"
      }

  * POST - /api/users/signin
    * body_params:
      %{
        "user" => %{
          "email" => "xxxxx",
          "password" => "xxxxx"
        }
      }

    * responce:
      {
        "email": "xxxxx",
        "first_name": "xxxxx",
        "last_name": "xxxxx",
        "token": "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.......xxxxx"
      }

  * POST - /api/contacts
    * Headers - %{
      "Authorization" => "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.......xxxxx"
    }


    * body_params:
      %{
        "contact" => %{
          "first_name" => "xxxxx",
          "last_name" => "xxxxx",
          "email" => "xxxxx",
          "phone_number" => "xxxxx",
          "date_of_birth" => %{
            "day" => "xx",
            "month" => "xx",
            "year" => "xxxx"
          }
        }
      }

    * responce:
      {
        "data": {
          "date_of_birth": "xxxx-xx-xx",
          "email": "xxxxx",
          "first_name": "xxxxx",
          "id": xxxxx,
          "last_name": "xxxxx",
          "phone_number": "xxxxx"
        }
      }

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
