defmodule LiveChartWeb.LiveBarComponent do
  @moduledoc """
  Bar Chart Component
  """

  use Phoenix.LiveComponent

  def update(assigns, socket) do
    x_axis = assigns.chart.dataset.axes.magnitude_axis
    # Hardcode the number of steps to take as 5 for now
    grid_lines = x_axis.grid_lines.({x_axis.min, x_axis.max}, 10)

    grid_line_offsetter = fn grid_line ->
      result = 100 * grid_line / x_axis.max
      result
    end

    socket =
      socket
      |> assign(:chart, assigns.chart)
      |> assign(:bars, LiveChart.BarChart.bars(assigns.chart))
      |> assign(:grid_lines, grid_lines)
      |> assign(:offsetter, grid_line_offsetter)

    {:ok, socket}
  end

  def render(assigns) do
    Phoenix.View.render(LiveChartWeb.ComponentView, "live_bar.html", assigns)
  end
end
