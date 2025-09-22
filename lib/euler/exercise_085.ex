defmodule Euler.Exercise_085 do
  @moduledoc """
  Counting Rectangles

  By counting carefully it can be seen that a rectangular grid measuring 3 by 2 contains eighteen rectangles.
  Although there exists no rectangular grid that contains exactly two million rectangles, find the area of the grid with the nearest solution.
  """

  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def solution(n \\ 2000000) do
    for w <- 2..100, h <- 2..100, numRectangles(w, h) < n do
      {w, h, abs(n - numRectangles(w, h))}
    end
    |> Enum.min_by(fn {_, _, diff} -> diff end)
    |> (fn {w, h, _} -> w * h end).()
  end

  def triangular(n), do: div(n * (n + 1), 2)

  def numRectangles(w, h), do: triangular(w) * triangular(h)
end
