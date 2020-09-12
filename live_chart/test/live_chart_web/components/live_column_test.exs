defmodule LiveChartWeb.LiveColumnComponentTest do
  alias LiveChartWeb.LiveColumnComponent
  import Phoenix.LiveViewTest
  use ExUnit.Case
  @endpoint LiveChart.Endpoint
  @base_chart %LiveChart.BaseChart{title: "this title"}

  describe "LiveColumnComponent" do
    test "renders" do
      assert render_component(LiveColumnComponent, chart: @base_chart) =~
               ~s(data-testid="lc-live-column-component")
    end

    test "renders the chart's title" do
      assert render_component(LiveColumnComponent, chart: @base_chart) =~ @base_chart.title
    end
  end
end
