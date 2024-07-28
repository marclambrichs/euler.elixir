defmodule Euler.Exercise_006 do
  @moduledoc """
  The sum of the squares of the first ten natural numbers is 1**2 + 2**2 + ... + 10**2 = 385.

  The square of the sum of the first ten natural numbers is
  (1 + 2 + 3 + ... + 10) ** 2 = 55 ** 2 = 3025.

  Hence he difference between the sum of the squares of the first ten natural numbers and the square of the sum is
  3025 - 385 = 2640.

  Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
  """

  def solution(max \\ 100) do
    square_of_sum(max) - sum_of_squares(max)
  end

  def sum_of_squares(max) do
    Stream.iterate(1, &(&1 + 1))
    |> Stream.take_while(fn x -> x <= max end)
    |> Enum.reduce(0, fn x, acc -> acc + x ** 2 end)
  end

  def square_of_sum(max) do
    Stream.iterate(1, &(&1 + 1))
    |> Stream.take_while(fn x -> x <= max end)
    |> Enum.reduce(0, fn x, acc -> acc + x end)
    |> Kernel.**(2)
  end
end
