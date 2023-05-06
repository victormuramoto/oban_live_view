defmodule ObanLiveView.Jobs.DummyJob do
  use Oban.Worker, queue: :events

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"id" => id}}) do
    IO.inspect(id)
  end
end
