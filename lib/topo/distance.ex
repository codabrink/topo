defmodule Topo.Distance do
  @moduledoc false

  alias Topo.PointLine

  @type geo_struct ::
          %Geo.Point{}
          | %Geo.MultiPoint{}
          | %Geo.LineString{}
          | %Geo.MultiLineString{}
          | %Geo.Polygon{}
          | %Geo.MultiPolygon{}

  @spec distance(geo_struct, geo_struct) :: float
  def distance(%Geo.LineString{} = a, %Geo.Point{} = b),
    do: PointLine.distance(a.coordinates, b.coordinates)

  def distance(%Geo.Point{} = a, %Geo.LineString{} = b), do: distance(b, a)

  def distance(%Geo.LineString{} = a, %Geo.LineString{} = b) do
    cond do
      Topo.intersects?(a, b) ->
        0

      true ->
        Enum.reduce(a.coordinates, fn p, closest ->
          min(closest, PointLine.distance(b.coordinates, p))
        end)
    end
  end
end
