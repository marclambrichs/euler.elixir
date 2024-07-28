defmodule Euler.Exercise_007 do
  @moduledoc """
  By listing the first six prime numbers: 2, 3, 5, 7, 11 and 13,
  we can see that the 6th prime is 13.
  What is the 10.001th prime?
  """
  def solution(n \\ 10_001) do
    primes(n) |> Enum.fetch!(-1)
  end

  def primes(n), do: Stream.iterate(2, &(&1 + 1)) |> Stream.filter(&is_prime?(&1)) |> Enum.take(n)

  def is_prime?(n) when n in [2, 3], do: true

  def is_prime?(n) do
    limit = :math.sqrt(n) |> floor()
    !Enum.any?(2..limit, &(rem(n, &1) == 0))
  end
end
