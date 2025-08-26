defmodule Euler.Exercise_081 do
  @moduledoc """
  Path Sum: Two Ways

  Find the minimal path sum from the top left to the bottom right by only moving right and down in matrix.txt,
  containing a 80 x 80 matrix.
  """
  @max 79

  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def matrix() do
    matrix =
      from_file("priv/files/0081_matrix.txt")
      |> Enum.map(&read_line/1)

    for(i <- 0..@max, j <- 0..@max, do: {i, j})
    |> Enum.reduce(Map.new(), fn {i, j}, map ->
      Map.put(map, {i, j}, Enum.at(Enum.at(matrix, j), i))
    end)
  end

  def solution(matrix \\ matrix()) do
    {cost, _path} = Euler.Dijkstra.shortest_path(matrix, {0, 0}, {@max, @max})
    cost
  end

  def from_file(file) do
    file
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end

  def read_line(str), do: String.split(str, ",") |> Enum.map(&String.to_integer/1)
end

defmodule Euler.Dijkstra do
  @max 79
  def shortest_path(graph, start, finish) when is_map(graph) do
    shortest_path(graph, [{Map.fetch!(graph, start), [start]}], finish, [])
  end

  def shortest_path(_graph, [], _finish, _visited), do: {0, []}

  def shortest_path(_graph, [{cost, [finish | _] = path} | _], finish, _visited) do
    {cost, Enum.reverse(path)}
  end

  @doc """
  Recursive case
  """
  def shortest_path(graph, [{cost, [node | _] = path} | routes], finish, visited) do
    newRoutes =
      for {newNode, newCost} <- graph,
          is_neighbour?(node, newNode),
          newNode not in visited do
        {cost + newCost, [newNode | path]}
      end

    shortest_path(graph, Enum.sort(newRoutes ++ routes), finish, [node] ++ visited)
  end

  def is_neighbour?({@max, y}, {i, j}), do: i == @max and j == y + 1
  def is_neighbour?({x, @max}, {i, j}), do: i == x + 1 and j == @max
  def is_neighbour?({x, y}, {i, j}), do: (i == x + 1 and j == y) or (i == x and j == y + 1)
end
