defmodule Euler.Exercise_069 do
  @moduledoc """
  Totient Maximum

  Euler's totient function, φ(n), is defined as the number of positive integers not exceeding n
  which are relatively prime to n. For example, as 1, 2, 4, 5, 7 and 8, are all less than or equal to 9 and
  relatively prime to 9, φ(9) = 6

  It can be seen that n = 6 produces a maximum n/φ(n) for n <= 10.
  Find the value of n <= 1_000_000 for which n/φ(n) is a maximum.
  """
  alias Euler.Globals

  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def solution(n \\ 1_000_000) do
    2..n
    |> Stream.map(&{&1, φ2(&1)})
    |> Enum.reduce({0, 0}, fn {a, phi}, {b, max} ->
      calc = a / phi
      if calc > max, do: {a, calc}, else: {b, max}
    end)
  end

  @doc """
  Slow.....
  """
  def φ(n) when n > 0 do
    1..(n - 1)
    |> Stream.filter(&(Integer.gcd(&1, n) == 1))
    |> Enum.count()
  end

  @doc """
  https://en.wikipedia.org/wiki/Euler%27s_totient_function
  """
  def φ2(n) when n > 1 do
    Globals.primefactors(n) |> Enum.reduce(n, fn x, acc -> acc * (1 - 1 / x) end)
  end
end
