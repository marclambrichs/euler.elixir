defmodule Euler.Globals.Dijkstra do

  @max 79

  def shortest_path(graph, start) when is_map(graph) do
    shortest_path(graph, [{Map.fetch!(graph, start), [start]}], [])
  end

  def shortest_path(_graph, [], _visited), do: {0, []}

  def shortest_path(_graph, [{cost, [{@max, @max} | _] = path} | _], _visited) do
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

  def neighbours({x, y}), do: [{x + 1, y}, {x, y + 1}, {x, y - 1}, {x - 1, y}]
end
