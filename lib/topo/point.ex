defmodule Topo.Point do
  @half_pi :math.pi() / 2

  def translate(%Geo.Point{} = p, length, angle) do
    %{coordinates: {px, py}} = p
    dy = :math.sin(angle) * length
    dx = :math.cos(angle) * length
    %{p | coordinates: {px + dx, py + dy}}
  end

  def x_translate(%Geo.Point{} = p, dx, angle \\ 0.0) do
    %{coordinates: {px, py}} = p
    dy = :math.tan(angle) * dx
    %{p | coordinates: {px + dx, py + dy}}
  end

  def y_translate(%Geo.Point{} = p, dy, angle \\ @half_pi) do
    %{coordinates: {px, py}} = p
    dx = dy / :math.tan(angle)
    %{p | coordinates: {px + dx, py + dy}}
  end
end
