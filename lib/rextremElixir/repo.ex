defmodule RextremElixir.Repo do
  use Ecto.Repo,
    otp_app: :rextremElixir,
    adapter: Ecto.Adapters.Postgres
end
