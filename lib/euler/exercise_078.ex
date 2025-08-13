defmodule Euler.Exercise_078 do
  @moduledoc """
  """

  alias Euler.Partitions
  def timer(), do: :timer.tc(__MODULE__, :solution, []) |> elem(0) |> Kernel./(1_000_000)

  def solution() do
    Partitions.partition_count_stream()
    |> Stream.drop_while(fn {_a, b} -> rem(b, 1_000_000) != 0 end)
    |> Enum.take(1)
  end
end

defmodule Euler.Partitions do
  @moduledoc """
  https://en.wikipedia.org/wiki/Partition_function_(number_theory)
  """
  alias Euler.Pentagonal

  def partition_count_stream do
    Stream.unfold(
      {1, Map.new()},
      fn {x, cache} ->
        nr_of_partitions = p(x, cache)
        {{x, nr_of_partitions}, {x + 1, Map.put(cache, x, nr_of_partitions)}}
      end
    )
  end

  defp p(n, cache),
    do:
      Enum.take_while(Pentagonal.numbers(), &(n >= &1))
      |> Enum.map(fn x -> p_from_cache(n - x, cache) end)
      |> Stream.zip(Stream.cycle([1, 1, -1, -1]))
      |> Enum.map(fn {a, b} -> a * b end)
      |> Enum.sum()

  defp p_from_cache(n, _cache) when n < 0, do: 0
  defp p_from_cache(0, _cache), do: 1
  defp p_from_cache(1, _cache), do: 1
  defp p_from_cache(n, cache), do: Map.get(cache, n)
end

defmodule Euler.Pentagonal do
  @moduledoc """
  https://en.wikipedia.org/wiki/Pentagonal_number_theorem
  gk = k(3k − 1)/2 for k = 1, −1, 2, −2, 3, ...
  """
  def numbers do
    Stream.iterate(1, &next/1)
    |> Stream.map(fn x -> div(x * (3 * x - 1), 2) end)
  end

  @spec next(number()) :: number()
  defp next(x) when x > 0, do: -1 * x
  defp next(x) when x < 0, do: abs(x) + 1
end
