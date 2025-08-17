defmodule Euler.Exercise_070 do
  @moduledoc """
  Totient Permutation

  Euler's totient function, φ(n), is defined as the number of positive integers not exceeding n
  which are relatively prime to n. For example, as 1, 2, 4, 5, 7 and 8, are all less than or equal to 9 and
  relatively prime to 9, φ(9) = 6

  Find the value of n, 1 < n < 10 ** 7, for which φ(n) is a permutation of n and the ration n/φ(n) produces a minimum.

  https://en.wikipedia.org/wiki/Euler%27s_totient_function
  Rationale:
  n/φ(n) minimum? This means that φ(n) is near n
  because φ(n) = n - 1, φ(n) must be a product of at least 2 primes

  """
  alias Euler.Globals.Sieve

  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def solution(n \\ 10_000_000) do
    primes = Sieve.upto(10_000)

    for x <- primes, y <- primes, x > y do
      {x * y, (x - 1) * (y - 1)}
    end
    |> Enum.filter(fn {a, b} -> a < n and is_permutation?({a, b}) end)
    |> Enum.min_by(fn {a, b} -> a / b end)
  end

  def is_permutation?({a, b}),
    do: Integer.digits(a) |> Enum.sort() == Integer.digits(b) |> Enum.sort()
end
