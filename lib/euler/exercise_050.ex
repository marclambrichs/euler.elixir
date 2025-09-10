defmodule Euler.Exercise_050 do
  @moduledoc """
  Consecutive Prime Sum

  Solution:
  * Built a list of tuples (prime, sum) where sum < max and sum is the sum of preceding primes including.
  """
  alias Euler.Globals
  alias Euler.Globals.Sequences.Sieve, as: S

  def solution(max \\ 1_000_000) do
    S.stream()
#    Globals.primes()
    |> generate(max)
    |> Enum.reduce({0, 0}, fn {steps, sum}, acc ->
      if steps > elem(acc, 0) do
        {steps, sum}
      else
        acc
      end
    end)
  end

  def generate(list, max) do
    Stream.resource(
      fn -> {0, 0} end,
      fn {count, first} ->
        if first > max do
          {:halt, first}
        else
          {generate_list(Stream.drop(list, count), max),
           {count + 1, Enum.take(list, count + 1) |> Enum.max()}}
        end
      end,
      fn values -> values end
    )
  end

  def generate_list(list, max) when not is_list(list) do
    Stream.with_index(list, 1)
    |> Stream.transform(0, fn {prime, index}, acc ->
      if acc + prime < max, do: {[{index, prime + acc}], prime + acc}, else: {:halt, acc}
    end)
    |> Stream.filter(&Globals.is_prime?(elem(&1, 1)))

    #    |> Enum.to_list()
    #    |> Enum.take(-1)
  end

  #
  #  def solution(max \\ 1_000_000) do
  #    Globals.primes(max)
  #    |> Enum.reverse()
  #    |> check_tails(max)
  #    |> Enum.max_by(fn {_x, _sum, steps} -> steps end)
  #  end
  #
  #  def check_tails([x], _max), do: [{x, x, 1}]
  #
  #  def check_tails([_h | t] = list, max) do
  #    [find_max_prime_in_tail(list, max)] ++ check_tails(t, max)
  #  end
  #
  #  def find_max_prime_in_tail(list, max) do
  #    Enum.reduce(list, [{0, 0, 0}], fn x, [{_y, sum, count} | _t] = acc ->
  #      if sum + x < max do
  #        [{x, sum + x, count + 1}] ++ acc
  #      else
  #        acc
  #      end
  #    end)
  #    |> Enum.filter(fn {_x, sum, _count} -> Globals.is_prime?(sum) end)
  #    |> Enum.max_by(fn {_x, sum, _count} -> sum end)
  #  end
  #
  #  def primes(max),
  #    do:
  #      1..max
  #      |> Enum.reduce([{0, 0}], fn x, acc ->
  #        if is_prime?(acc, x), do: [{x, elem(hd(acc), 1) + x} | acc], else: acc
  #      end)
  #
  #  defp is_prime?(_primes, 1), do: false
  #  defp is_prime?(primes, n), do: !Enum.any?(primes, &(rem(n, &1) == 0))
end
