defmodule Euler.Exercise_077 do
  @moduledoc """
  Prime Summations

  It is possible to write ten as the sum of primes in exactly five different ways.

  What is the first value which can be written as the sum of primes in over five thousand different ways?
  """

  alias Euler.Globals

  def timer(), do: :timer.tc(__MODULE__, :solution, []) |> elem(0) |> Kernel./(1_000_000)

  def solution(n \\ 5_000) do
    Stream.iterate(2, &(&1 + 1))
    |> Stream.map(&prime_combinations/1)
    |> Stream.filter(&(elem(&1, 1) > n))
    |> Enum.take(1)
  end

  def prime_combinations(n) do
    {n,
     prime_combinations(
       n,
       (n - 2)..2//-1 |> Enum.to_list() |> Enum.filter(&Globals.is_prime?(&1))
     )}
  end

  def prime_combinations(n, primes), do: prime_combinations(n, primes, 0)

  def prime_combinations(n, [], n), do: 1
  def prime_combinations(_, [], _), do: 0

  def prime_combinations(x, [h | t], sum) when sum + h == x do
    1 + prime_combinations(x, t, sum)
  end

  def prime_combinations(x, [h | t], sum) when sum + h < x do
    prime_combinations(x, [h | t], sum + h) + prime_combinations(x, t, sum)
  end

  def prime_combinations(x, [h | t], sum) when sum + h > x do
    prime_combinations(x, t, sum)
  end
end
