defmodule ObanLiveView.Repo.Migrations.CreateOban do
  use Ecto.Migration

  def change do
    Oban.Migrations.up()
  end
end
