defmodule Euler.Exercise_082 do
  @moduledoc """
  Path Sum: Three Ways

  Find the minimal path sum from the left column to the right column in matrix.txt,
  containing a 80 x 80 matrix.
  """
  @max 4

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
    from_file("priv/files/0082_matrix.txt")
    |> Enum.map(&read_line/1)
  end

  def solution(matrix \\ small()) do
    map =
      for(i <- 0..@max, j <- 0..@max, do: {i, j})
      |> Enum.reduce(Map.new(), fn {i, j}, map ->
        Map.put(map, {i, j}, Enum.at(Enum.at(matrix, j), i))
      end)

    {cost, _path} = Euler.Dijkstra82.shortest_path(map, {0, 0})

    solution(map, 1, cost)
  end

  def solution(_matrix, n, acc) when n > @max, do: acc

  def solution(matrix, n, acc) do
    {cost, _path} = Euler.Dijkstra82.shortest_path(matrix, {0, n})
    IO.puts("n: #{n}, cost = #{cost}")
    if cost > acc, do: solution(matrix, n + 1, acc), else: solution(matrix, n + 1, cost)
  end

  def from_file(file) do
    file
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end

  def read_line(str), do: String.split(str, ",") |> Enum.map(&String.to_integer/1)
end

defmodule Euler.Dijkstra82 do
  @max 4
  def shortest_path(graph, start) when is_map(graph) do
    shortest_path(graph, [{Map.fetch!(graph, start), [start]}], [])
  end

  def shortest_path(_graph, [], _visited), do: {0, []}

  def shortest_path(_graph, [{cost, [{@max, _j} | _] = path} | _], _visited) do
    {cost, path}
  end

  @doc """
  Recursive case
  """
  def shortest_path(graph, [{cost, [node | _] = path} | routes], visited) do
    nodes = Map.keys(graph)

    newRoutes =
      for newNode <- neighbours(node),
          newNode in nodes,
          newNode not in visited do
        {cost + Map.fetch!(graph, newNode), [newNode | path]}
      end

    shortest_path(graph, Enum.sort(newRoutes ++ routes), [node] ++ visited)
  end

  def neighbours({x, y}), do: [{x + 1, y}, {x, y + 1}, {x, y - 1}]
end
