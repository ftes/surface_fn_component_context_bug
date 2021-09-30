defmodule SurfaceFnComponentContextBugWeb.PageLive do
  use Surface.LiveView

  def render(assigns) do
    ~F"""
    <.fn_with_plain_html_works_fine />
    <.fn_with_nested_component_breaks />
    """
  end

  defp fn_with_plain_html_works_fine(assigns) do
    ~F"""
    <div>No problem</div>
    """
  end

  defp fn_with_nested_component_breaks(assigns) do
    ~F"""
    <Surface.Components.Link label="produces __context__ error" to="/" />
    """
  end
end
