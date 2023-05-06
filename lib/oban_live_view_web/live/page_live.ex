defmodule ObanLiveViewWeb.PageLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div>
      <h1>Scheduled Jobs</h1>
      <ul>
        <%= for job <- @scheduled_jobs do %>
          <li>
            <%= inspect job %>
          </li>
        <% end %>
      </ul>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, update_scheduled_jobs(socket)}
  end

  defp update_scheduled_jobs(socket) do
    {:noreply, assign(socket, scheduled_jobs: Oban.lookup(:events))}
  end
end
