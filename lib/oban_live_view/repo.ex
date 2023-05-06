defmodule ObanLiveView.Repo do
  use Ecto.Repo,
    otp_app: :oban_live_view,
    adapter: Ecto.Adapters.Postgres
end
