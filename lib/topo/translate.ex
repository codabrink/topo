defmodule Topo.Translate do
  alias Topo.Point

  @type geo_struct ::
          %Geo.Point{}

  @spec translate(geo_struct, float, float) :: geo_struct
  def translate(%Geo.Point{} = a, distance, angle), do: Point.translate(a, distance, angle)

  @spec x_translate(geo_struct, float, float) :: geo_struct
  def x_translate(%Geo.Point{} = a, dx, angle), do: Point.x_translate(a, dx, angle)

  @spec y_translate(geo_struct, float, float) :: geo_struct
  def y_translate(%Geo.Point{} = a, dy, angle), do: Point.y_translate(a, dy, angle)
end
