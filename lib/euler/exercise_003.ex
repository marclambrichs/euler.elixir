defmodule Euler.Exercise_003 do
  @moduledoc """
  The prime factors of 13195 are 5, 7, 13 and 29.
  What is the largest prime factor of the number 600851475153?
  """
  @spec solution(integer()) :: list()
  def solution(n \\ 600_851_475_143) do
    limit = :math.sqrt(n) |> floor

    calculate_factors(n, 2, [], limit)
    |> Enum.max()
  end

  def calculate_factors(_n, divisor, factors, limit) when divisor > limit, do: factors

  def calculate_factors(n, 2, factors, limit) when rem(n, 2) == 0,
    do: calculate_factors(div(n, 2), 2, [2 | factors], limit)

  def calculate_factors(n, divisor, factors, limit) when rem(n, divisor) == 0 do
    calculate_factors(div(n, divisor), divisor, [divisor | factors], limit)
  end

  def calculate_factors(n, divisor, factors, limit) when rem(n, divisor) != 0 do
    calculate_factors(n, divisor + 1, factors, limit)
  end

  def primes(), do: Stream.iterate(2, &(&1 + 1)) |> Stream.filter(&is_prime?(&1))

  def is_prime?(n) when n in [2, 3], do: true

  def is_prime?(n) do
    limit = :math.sqrt(n) |> floor()
    !Enum.any?(2..limit, &(rem(n, &1) == 0))
  end
end
