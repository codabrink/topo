defmodule Topo.Common do
  @moduledoc false

  alias Topo.PointLine

  def side(%Geo.LineString{} = a, %Geo.Point{} = b),
    do: PointLine.side(a.coordinates, b.coordinates)

  def side(%Geo.Point{} = a, %Geo.LineString{} = b), do: side(b, a)
end
