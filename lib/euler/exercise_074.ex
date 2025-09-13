defmodule Euler.Exercise_074 do
  @moduledoc """
  Digit Factorial Chains

  The number 145 is well known for the property that the sum of the factorial of its digits is equal to 145.

  Perhaps less well known is 169, in that it produces the longest chain of numbers that link back to 169;
  it turns out that there are only three such loops that exist:
  169
  871
  872

  How many chains, with a starting number below one million, contain exactly sixty non-repeating terms?
  """
  alias Euler.Globals, as: G

  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def solution(n \\ 1000000) do
    Stream.filter(70..n - 1, fn a -> chain(a) |> Enum.count() == 60 end)
    |> Stream.map(fn _a -> 1 end)
    |> Enum.sum()
  end

  def chain(n) do
    chain(
      n,
      Enum.map(0..9, fn
        0 -> {0, 1}
        x -> {x, G.fac(x)}
      end)
      |> Map.new()
    )
  end

  def chain(n, primes) do
    Stream.unfold(
      {n, MapSet.new()},
      fn {a, cache} ->
        if MapSet.member?(cache, a) do
          nil
        else
          {a, {step(a, primes), MapSet.put(cache, a)}}
        end
      end
    )
  end

  def step(x, primes) do
    Integer.digits(x)
    |> Enum.reduce(0, &(Map.get(primes, &1) + &2))
  end
end
