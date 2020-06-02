defmodule Topo.Angle do
  alias Topo.PointPoint

  @type geo_struct ::
          %Geo.Point{}
          | %Geo.MultiPoint{}
          | %Geo.LineString{}
          | %Geo.MultiLineString{}
          | %Geo.Polygon{}
          | %Geo.MultiPolygon{}

  @spec angle(geo_struct, geo_struct) :: float
  def angle(%Geo.Point{} = a, %Geo.Point{} = b),
    do: PointPoint.angle(a.coordinates, b.coordinates)
end
