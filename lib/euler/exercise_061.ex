defmodule Euler.Exercise_061 do
  @moduledoc """
  Cyclical Figurate Numbers
  """
  @funs [:triangle, :square, :pentagonal, :hexagonal, :heptagonal, :octogonal]

  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def search(solutions) do
    #    IO.inspect funs, label: "funs"
    #    IO.inspect solutions, label: "solutions"
    Enum.reduce(3..8, solutions, fn fun, acc ->
      nil
      ##      if acc == [] do
      ##        {:halt, []}
      ##      else
      ##        {:cont,
      #         Enum.flat_map(
      #           (apply(__MODULE__, fun, []) |> Enum.filter(&(rem(hd(acc), 100) == div(&1, 100)))) |> IO.inspect(label: "reduce"),
      #           &search(funs -- [fun], [&1] ++ acc |> IO.inspect(label: "next"))
      #         )
      #       # }
      ##      end
    end)
  end

  def polygonal(s, n), do: div((s - 2) * n * n - (s - 4) * n, 2)
  def triangle(), do: Stream.iterate(1, &(&1 + 1)) |> Stream.map(&polygonal(3, &1))
  #  def triangle(), do: 45..140 |> Enum.map(&div(&1 * (&1 + 1), 2))
  def square(), do: 32..99 |> Enum.map(&(&1 * &1))
  def pentagonal(), do: 26..81 |> Enum.map(&div(&1 * (3 * &1 - 1), 2))
  def hexagonal(), do: 23..70 |> Enum.map(&(&1 * (2 * &1 - 1)))
  def heptagonal(), do: 21..63 |> Enum.map(&div(&1 * (5 * &1 - 3), 2))
  def octogonal(), do: 19..58 |> Enum.map(&(&1 * (3 * &1 - 2)))
end
