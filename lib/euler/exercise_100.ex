defmodule Euler.Exercise_100 do
  @moduledoc """
  Arranged Probability

  Taking two blue disks at random from a box containing 15 blue and 6 red disks is 1/2.
  Find the first n over 10 ** 12, representing a number of (red and blue) disks and determine the number of blue
  disks that generate a change of exactly 1/2.

  First solution:
  t^2 - 2b^2 + 2b - t = 0
  Used https://www.alpertron.com.ar/QUAD.HTM.

  Second solution:
  Rewrite above solution to a Pell's equation:
  2(b^2 - b) - (t^2 - t) = 0
  2(b^2 - b + 1/4 - 1/4) - (t^2 - t + 1/4 - 1/4) = 0
  2(b - 1/2)^2 - 1/2 - (t - 1/2)^2 + 1/4 = 0
  2(b - 1/2)^2 - (t - 1/2)^2 - 1/4 = 0

  Now, subsite
  b - 1/2 = u/2 and t - 1/2 = v/2, so
  2(u/2)^2 - (v/2)^2 - 1/4 = 0
  2u^2/4 - v^2/4 - 1/4 = 0
  2u^2 - v^2 - 1 = 0
  which is a negative Pell's equation: v^2 - 2u^2 = -1
  (https://en.wikipedia.org/wiki/Pell%27s_equation#The_negative_Pell's_equation)

  Now, look at the continued fraction sqrt(2), to find out that v = 1 and u = 1

  Now, all solutions to v^2 -2u^2 = -1 can be found by:
  v(n + 2) = 3 * v + 4 * u
  u(n + 2) = 2 * v + 3 * u

  v(2) = 3 * 3 + 2 * 2 * 2 = 17 => t = 17/2 + 1/2
  u(2) = 2 * 3 + 3 * 2 = 12     => b = 6 + 1/2

  Next, - because of the previous substitution - calculate t and b.
  """

  def timer(solution \\ :solution), do: :timer.tc(__MODULE__, solution, [])

  def solution() do
    Stream.unfold({15, 21}, fn {b, t} -> {{b, t}, {3 * b + 2 * t - 2, 4 * b + 3 * t - 3}} end)
    |> Stream.filter(&(elem(&1, 1) >= 10 ** 12))
    |> Enum.take(1)
  end

  def solution2() do
    Stream.unfold({1, 1}, fn {v, u} -> {{v, u}, {3 * v + 4 * u, 2 * v + 3 * u}} end)
    |> Stream.map(fn {x, y} -> {Integer.floor_div(x + 1, 2), Integer.floor_div(y + 1, 2)} end)
    |> Stream.filter(&(elem(&1, 0) >= 10 ** 12))
    |> Enum.take(1)
  end
end
