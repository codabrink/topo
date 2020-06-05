import Math

defmodule PointTest do
  use ExUnit.Case

  @point %Geo.Point{coordinates: {0, 0}}

  test "translate" do
    assert Topo.translate(@point, 1, 0.0) == %Geo.Point{coordinates: {1, 0}}

    Topo.translate(@point, 1, :math.pi())
    |> effectively_equal(%{coordinates: {-1, 0}})
  end

  test "x_translate" do
    Topo.x_translate(@point, 1, :math.pi() / 4)
    |> effectively_equal(%{coordinates: {1, 1}})
  end

  test "y_translate" do
    Topo.y_translate(@point, 1, :math.pi() * 0.75)
    |> effectively_equal(%{coordinates: {-1, 1}})
  end

  def effectively_equal(%{coordinates: {ax, ay}}, %{coordinates: {bx, by}}) do
    assert ax <~> bx && ay <~> by
  end
end
