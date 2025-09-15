defmodule Euler.Exercise_075 do
  @moduledoc """
  Singular Integer Right Triangles
  """
  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def solution(limit \\ 1_500_000) do
    triples(limit)
    |> Enum.reduce(Map.new(), fn tuple, cache ->
      Map.update(cache, Tuple.sum(tuple), 1, &(&1 + 1))
    end)
    |> Enum.filter(fn {_k, v} -> v == 1 end)
    |> Enum.count()
  end

  def triples(limit) do
    primitive_triples({3, 4, 5}, limit)
    |> Stream.flat_map(&transform(&1, limit))
  end

  def transform({a, b, c}, limit) do
    Stream.duplicate({a, b, c}, div(limit, c))
    |> Stream.scan(fn {a, b, c}, {x, y, z} -> {a + x, b + y, c + z} end)
    |> Stream.filter(fn {a, b, c} -> a + b + c < limit end)
    |> Stream.uniq()
  end

  def primitive_triples({a, b, c}, limit) when a + b + c > limit, do: []

  def primitive_triples({a, b, c}, limit) do
    [{a, b, c}] ++
      primitive_triples({a + -2 * b + 2 * c, 2 * a - b + 2 * c, 2 * a - 2 * b + 3 * c}, limit) ++
      primitive_triples({a + 2 * b + 2 * c, 2 * a + b + 2 * c, 2 * a + 2 * b + 3 * c}, limit) ++
      primitive_triples({-a + 2 * b + 2 * c, -2 * a + b + 2 * c, -2 * a + 2 * b + 3 * c}, limit)
  end
end
