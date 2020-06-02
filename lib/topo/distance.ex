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
end
