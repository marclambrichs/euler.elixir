defmodule Euler.Exercise_010 do
  @moduledoc """
  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  Find the sum of all the primes below two million.
  """
  def solution(n \\ 2_000_000) do
    primes(n)
  end

  def primes(n),
    do:
      Stream.iterate(2, &(&1 + 1))
      |> Stream.filter(&is_prime?(&1))
      |> Stream.take_while(fn x -> x < n end)
      |> Enum.reduce(0, fn x, acc -> x + acc end)

  def is_prime?(n) when n in [2, 3], do: true

  def is_prime?(n) do
    limit = :math.sqrt(n) |> floor()
    !Enum.any?(2..limit, &(rem(n, &1) == 0))
  end
end
