defmodule Euler.Exercise_078 do

  @moduledoc """
  Coin Partitions

  Let p(n) represent the number of different ways in which n coins can be separated into piles. For example, five coins can be
  separated into piles in exactly seven different ways, so p(5) = 7.

  Find the least value of n for which p(n) is divisible by one million.
  """

  alias Euler.Partitions
  def timer(), do: :timer.tc(__MODULE__, :solution, []) |> elem(0) |> Kernel./(1_000_000)

  def solution() do
    Partitions.partition_count_stream()
    |> Stream.drop_while(fn {_a, b} -> rem(b, 1_000_000) != 0 end)
    |> Enum.take(1)
  end
end
