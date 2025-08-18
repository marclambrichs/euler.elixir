defmodule Euler.Exercise_072 do
  @moduledoc """
  Counting Fractions

  How many elements would be contained in the set of reduced proper fractions for d <= 1_000_000?
  """
  alias Euler.Globals
  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def solution(n \\ 1_000_000) do
    Stream.iterate(2, &(&1 + 1))
    |> Stream.map(&{&1, φ(&1)})
    |> Stream.take_while(fn {a, _b} -> a <= n end)
    |> Enum.reduce(0, fn {_a, b}, acc -> acc + b end)
  end

  def φ(n) when n > 1 do
    Globals.primefactors(n) |> Enum.reduce(n, fn x, acc -> acc * (1 - 1 / x) end)
  end
end
