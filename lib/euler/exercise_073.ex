defmodule Euler.Exercise_073 do
  @moduledoc """
  Counting Fractions in a Range

  How many fractions lie between 1/3 and 1/2 in the sorted set of reduced proper fractions for d <= 12000
  """
  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def solution(n \\ 12000) do
    for i <- 5..n do
      fractions(i)
    end
    |> Enum.sum()
  end

  def fractions(n) when n >= 4 do
    Stream.filter(div(n, 3)..div(n, 2), fn x ->
      frac = x / n
      frac > 1 / 3 and frac < 1 / 2 and Integer.gcd(x, n) == 1
    end)
    |> Enum.take(div(n, 2))
    |> Enum.count()
  end
end
