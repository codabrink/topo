defmodule Topo.PointPoint do
  def angle({ax, ay}, {bx, by}) do
    :math.atan2(by - ay, bx - ax)
  end
end
