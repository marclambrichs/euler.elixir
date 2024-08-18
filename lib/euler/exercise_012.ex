defmodule Euler.Exercise_012 do
  @moduledoc """
  The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be
  1 + 2 + 3 + 4 + 5 + 6 + 7 = 28.

  The first 10 terms would be 1, 3, 6, 10, 15, 21, 28, 36, 45, 55

  We can see that 28 is the first triangle number to have over five divisors.

  What is the value of the first triangle number to have over five hundred divisors?
  """
  import Euler.Globals

  def brute_force(n \\ 500) do
    Stream.iterate(1, &(&1 + 1))
    |> Stream.map(&triangle/1)
    |> Stream.map(&{&1, &1 |> factors() |> length()})
    |> Stream.drop_while(fn {_a, b} -> b < n end)
    |> Enum.take(1)
  end

  # Recursive function
  defp triangle(1), do: 1
  defp triangle(n), do: n + triangle(n - 1)
end