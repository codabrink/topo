defmodule Topo.PointLine do
  @moduledoc false

  @spec relate(list, {number, number}) :: atom
  def relate([_], _), do: :disjoint

  def relate([a, b | rest], p) do
    cond do
      a == p -> :vertex
      b == p -> :vertex
      Topo.Util.collinear?(a, b, p) && Topo.Util.between?(a, b, p) -> :edge
      true -> relate([b | rest], p)
    end
  end

  def side([a, b], p) do
    Topo.Util.side(a, b, p)
  end

  def distance([], _), do: nil
  def distance([_], _), do: nil

  def distance([v, w | rest], p) do
    min(:math.sqrt(dist_to_segment_squared(p, v, w)), distance([w | rest], p))
  end

  defp dist_to_segment_squared({px, py}, {vx, vy}, {wx, wy}) do
    l2 = dist2({vx, vy}, {wx, wy})

    case l2 do
      0.0 ->
        dist2({px, py}, {vx, vy})

      _ ->
        t = ((px - vx) * (wx - vx) + (py - vy) * (wy - vy)) / l2
        t = max(0, min(1, t))
        dist2({px, py}, {vx + t * (wx - vx), vy + t * (wy - vy)})
    end
  end

  defp dist2({ax, ay}, {bx, by}) do
    :math.pow(ax - bx, 2) + :math.pow(ay - by, 2)
  end
end
