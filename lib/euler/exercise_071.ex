defmodule Euler.Exercise_071 do
  @moduledoc """
  Ordered Fractions

  By listing the set of reduced proper fractions for d <= 1_000_000 in ascending order of size, find the numerator of the fraction
  immediately left of 3/7

  https://en.wikipedia.org/wiki/Farey_sequence#Farey_neighbours
  a/b < p/q
  and p/q - a/b = 1/bq
  so bp - aq = 1
  and a = (bp - 1)/q
  """
  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def brute_force(n \\ 1_000_000) do
    for b <- n..1//-1, a <- div(b, 2)..1//-1, a / b < 3 / 7, a / b > 2 / 5, 3 * b - 7 * a == 1 do
      {a, b}
    end
    |> Enum.take(1)
  end

  def solution(n \\ 1_000_000) do
    Stream.unfold({0, 1, 2}, fn
      {_p, _q, ^n} ->
        nil

      {p, q, b} ->
        curr_num = div(3 * b - 1, 7)

        if p * b < curr_num * q do
          {{curr_num, b}, {curr_num, b, b + 1}}
        else
          {{p, q}, {p, q, b + 1}}
        end
    end)
    |> Enum.take(-1)
  end
end
