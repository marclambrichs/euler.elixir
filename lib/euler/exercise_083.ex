defmodule Euler.Exercise_083 do
  @moduledoc """
  Path Sum: Four Ways

  Find the minimal path sum from the left column to the right column in matrix.txt,
  containing a 80 x 80 matrix.
  """
  alias Euler.Globals.Dijkstra, as: Dijkstra

  @max 79

  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def small() do
    """
    131,673,234,103,18
    201,96,342,965,150
    630,803,746,422,111
    537,699,497,121,956
    805,732,524,37,331
    """
    |> String.trim()
    |> String.split(~r{[\s\n]})
    |> Enum.map(&String.split(&1, ","))
    |> Enum.map(&Enum.map(&1, fn x -> String.to_integer(x) end))
  end

  def matrix() do
    from_file("priv/files/0083_matrix.txt")
    |> Enum.map(&read_line/1)
  end

  defp from_file(file) do
    file
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end

  defp read_line(str), do: String.split(str, ",") |> Enum.map(&String.to_integer/1)

  def solution(matrix \\ matrix()) do
    map =
      for(i <- 0..@max, j <- 0..@max, do: {i, j})
      |> Enum.reduce(Map.new(), fn {i, j}, map ->
        Map.put(map, {i, j}, Enum.at(Enum.at(matrix, j), i))
      end)

    {cost, _path} = Dijkstra.shortest_path(map, {0, 0})
    cost
  end
end
