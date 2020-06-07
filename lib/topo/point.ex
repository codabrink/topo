defmodule Topo.Point do
  @half_pi :math.pi() / 2

  @spec translate(%Geo.Point{}, float, float) :: %Geo.Point{}
  def translate(%Geo.Point{} = p, len, angle) do
    %{coordinates: {px, py}} = p
    dy = :math.sin(angle) * len
    dx = :math.cos(angle) * len
    %Geo.Point{p | coordinates: {px + dx, py + dy}}
  end

  @spec x_translate(%Geo.Point{}, float, float) :: %Geo.Point{}
  def x_translate(%Geo.Point{} = p, dx, angle \\ 0.0) do
    %{coordinates: {px, py}} = p
    dy = :math.tan(angle) * dx
    %Geo.Point{p | coordinates: {px + dx, py + dy}}
  end

  @spec y_translate(%Geo.Point{}, float, float) :: %Geo.Point{}
  def y_translate(%Geo.Point{} = p, dy, angle \\ @half_pi) do
    %{coordinates: {px, py}} = p
    dx = dy / :math.tan(angle)
    %Geo.Point{p | coordinates: {px + dx, py + dy}}
  end
end
