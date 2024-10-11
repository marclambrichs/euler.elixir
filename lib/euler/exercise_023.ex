defmodule Euler.Exercise_023 do
  @moduledoc """
  A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the
  proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

  A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

  As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two
  abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the
  sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that
  the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

  Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
  """

  import Euler.Globals

  @limit 28123

  def solution() do
    abundants =
    1..@limit
    |> Enum.filter(&(factor_sum_type(&1) == :abundant))

    1..@limit
    |> Stream.filter(fn x -> !is_sum_of_abundants?(x, abundants, abundants) end)
    |> Enum.sum()
  end

  def factor_sum(n) when n > 0 do
    Enum.sum(factors(n)) - n
  end

  def factor_sum_type(n) when n > 0 do
    case factor_sum(n) do
      ^n -> :perfect
      x when x < n -> :deficient
      _ -> :abundant
    end
  end

  def is_sum_of_abundants?(_n, [], _abundants), do: false
  def is_sum_of_abundants?(n, [h|_t], _abundants) when n/2 < h, do: false
  def is_sum_of_abundants?(n, [h|t], abundants) do
    case Enum.member?(abundants, n - h) do
      true -> true
      _ -> is_sum_of_abundants?(n, t, abundants)
    end
  end

end
