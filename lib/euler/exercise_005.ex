defmodule Euler.Exercise_005 do
  @moduledoc """
  2520 is the smallest number that can be divided by each of the numbers from 1 to 10
  without any remainder.

  What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
  """

  def solution(max \\ 20) do
    Stream.iterate(1, &(&1 + 1))
    |> Stream.take_while(&(divisible?(&1, 1..max) == false))
    |> Enum.fetch!(-1)
    |> Kernel.+(1)
  end

  def divisible?(n, range) do
    Enum.uniq(Enum.map(range, fn x -> rem(n, x) == 0 end)) == [true]
  end
end
