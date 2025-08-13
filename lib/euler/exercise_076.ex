defmodule Euler.Exercise_076 do
  @moduledoc """
  It is possible to write five as a sum in exactly six different ways:
  4 + 1
  3 + 2
  3 + 1 + 1
  2 + 2 + 1
  2 + 1 + 1 + 1
  1 + 1 + 1 + 1 + 1

  How many different ways can one hundred be written as a sum of at least two positive integers?
  """
  alias Euler.Partitions
  def timer(), do: :timer.tc(__MODULE__, :solution, []) |> elem(0) |> Kernel./(1_000_000)

  def solution() do
    Partitions.partition_count_stream()
    |> Stream.drop_while(fn {a, _b} -> a < 100 end)
    |> Enum.take(1)
    |> Enum.map(fn {_n, nr_of_ways} -> nr_of_ways - 1 end)
  end
end
