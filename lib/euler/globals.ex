defmodule Euler.Globals do
  @moduledoc """
  Global functions.
  """

  @doc """
  Composite numbers
  """
  def composites(), do: Stream.iterate(4, &(&1 + 1)) |> Stream.filter(&(!is_prime?(&1)))

  @doc """
  Primes
  """
  def primes(), do: Stream.iterate(2, &(&1 + 1)) |> Stream.filter(&is_prime?(&1))
  def primes_below(n), do: Stream.take_while(primes(), &(&1 <= n))

  def primes(from, to),
    do:
      Stream.iterate(from, &(&1 + 1))
      |> Stream.filter(&is_prime?/1)
      |> Stream.take_while(&(&1 <= to))

  def is_prime?(0), do: false
  def is_prime?(1), do: false
  def is_prime?(2), do: true
  #  def is_prime?(n), do: !Enum.any?(2..(floor(:math.sqrt(n)) + 1), &(rem(n, &1) == 0))
  def is_prime?(n), do: is_prime?(1, n)

  def n_primes(n), do: primes() |> Enum.take(n)

  # TODO: faster?
  def is_prime?(_, 1), do: false
  def is_prime?(1, y), do: is_prime?(2, y)

  def is_prime?(x, y) do
    if x <= :math.sqrt(y) do
      rem(y, x) != 0 and is_prime?(x + 1, y)
    else
      true
    end
  end

  @doc """
  Get all primes below or equal to a certain number
  """
  def primes(max),
    do:
      1..max
      #      |> Enum.reduce([], fn x, acc -> if is_prime?(acc, x), do: [x | acc], else: acc end)
      |> Enum.reduce([], fn x, acc -> if is_prime?(x), do: [x | acc], else: acc end)

  #  defp is_prime?(_primes, 1), do: false
  #  defp is_prime?(primes, n), do: !Enum.any?(primes, &(rem(n, &1) == 0))

  @doc """
  Factors
  """
  def factors(max),
    do:
      1..max
      |> Enum.reduce([], fn x, acc -> if rem(max, x) == 0, do: [x | acc], else: acc end)

  @doc """
  Primefactors
  """
  def primefactors(n), do: primefactors(n, 2, []) |> Enum.uniq()

  def primefactors(n, n, factors), do: [n | factors]
  def primefactors(_n, divisor, factors) when divisor == 1, do: factors

  def primefactors(n, divisor, factors) when rem(n, divisor) == 0,
    do: primefactors(div(n, divisor), divisor, [divisor | factors])

  def primefactors(n, divisor, factors), do: primefactors(n, divisor + 1, factors)

  @doc """
  Fibonacci
  """
  def fibonacci(), do: Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)

  @doc """
  Factorial
  """
  def fac(1), do: 1
  def fac(n), do: n * fac(n - 1)

  # or
  def factorial(), do: Stream.unfold({1, 1}, fn {a, b} -> {a * b, {a + 1, a * b}} end)
  def factorial(0), do: 1
  def factorial(n), do: 1..n |> Enum.reduce(1, fn i, acc when i <= n -> acc * i end)

  @doc """
  n over k
  """
  def over(n, n), do: 1
  def over(n, k) when n > k, do: div(fac(n), fac(k) * fac(n - k))
  def over(_, _), do: 0

  @doc """
  Permutations
  """
  def permutations([]), do: [[]]

  def permutations(list) when is_list(list) do
    for elem <- list, rest <- permutations(list -- [elem]), do: [elem | rest]
  end

  def permutations(n) when is_integer(n), do: 1..n |> Enum.to_list() |> permutations()

  @doc """
  Translate list of digits to number.
  Or even beter: use Integer.undigits/2
  """
  def to_number(list) when is_list(list), do: Enum.reduce(list, 0, fn x, acc -> 10 * acc + x end)

  @doc """
  Generate all possible subsets of a list
  """
  def subsets(list) do
    0..length(list)
    |> Enum.reduce([], fn x, acc ->
      Enum.concat(combinations(x, list), acc)
    end)
  end

  def combinations(0, _), do: [[]]
  def combinations(_, []), do: []

  def combinations(size, [h | t]) do
    for elem <- combinations(size - 1, t) do
      [h | elem]
    end ++ combinations(size, t)
  end

  def is_perfect_square?(n) when n >= 0 do
    root = :math.sqrt(n)
    Float.floor(root) == root
  end

  def is_perfect_square?(_), do: false

  def triangle(), do: Stream.unfold(1, &{div(&1 * (&1 + 1), 2), &1 + 1})
end
