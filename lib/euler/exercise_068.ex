defmodule Euler.Exercise_068 do
  @moduledoc """
  Magic 5-gon ring

  Using the numbers 1 to 10, and depending on arrangements, it is possible to form 16- and 17-digit strings.
  What is the maximum 16-digit string for a "magic" 5-gon ring?
  """
  alias Euler.Globals, as: G

  @nr_of_elements 5

  def solution(n \\ @nr_of_elements) do
    Range.to_list(1..(n * 2))
    |> combinations(3)
    |> group_by_size()
    |> Enum.flat_map(&external_nodes/1)
    |> Enum.map(&generate_options/1)
    |> List.flatten()
    |> Enum.sort(&(&1 >= &2))
    |> Enum.take(1)
  end

  def generate_options([h | t]) do
    tail = Enum.map(t, &options(&1)) |> Enum.reduce([], &(&1 ++ &2))

    for list <- Enum.map(options(h), fn x -> x ++ next(x, tail) end) do
      Enum.map(list, fn {a, _} -> a end)
      |> Enum.chunk_every(3)
      # sorting
      |> sort()
      |> Enum.reduce("", fn triple, acc ->
        acc <> Enum.reduce(triple, "", fn x, nr -> nr <> Integer.to_string(x) end)
      end)
    end
  end

  def sort(list) do
    [min] = Enum.map(list, &first(&1)) |> Enum.sort() |> Enum.take(1)
    external_index = Enum.find_index(list, fn [a, _, _] -> a == min end)

    cond do
      external_index == 0 ->
        [Enum.fetch!(list, external_index)] ++
          Enum.slice(list, (external_index + 1)..(@nr_of_elements - 1))

      external_index == @nr_of_elements - 1 ->
        [Enum.fetch!(list, external_index)] ++ Enum.slice(list, 0..(external_index - 1))

      true ->
        [Enum.fetch!(list, external_index)] ++
          Enum.slice(list, (external_index + 1)..(@nr_of_elements - 1)) ++
          Enum.slice(list, 0..(external_index - 1))
    end
  end

  def first([a, _b, _c]), do: a
  def middle([_a, b, _c]), do: b
  def last([_a, _b, c]), do: c

  def next(prev, list) do
    next = Enum.filter(list, fn x -> first(prev) != first(x) and middle(x) == last(prev) end)

    case next do
      [] -> []
      [elt] -> elt ++ next(elt, list -- [elt])
    end
  end

  @doc """
  Options per 3-tuple [{a, 1}, {b, 2}, {c, 2}]
  """
  def options(list) do
    head = Enum.filter(list, &(elem(&1, 1) == 1))
    tail = list -- head
    [head ++ tail, head ++ Enum.reverse(tail)]
  end

  def group([h | t]),
    do:
      Enum.reduce(G.permutations(t), [], fn nodes, acc ->
        [[h] ++ nodes] ++ acc
      end)

  def combinations([]), do: []

  def combinations([xs | ys]) do
    for x <- xs, y <- combinations(ys), do: [x] ++ [y]
  end

  def combinations(_list, 0), do: [[]]
  def combinations([], _), do: []

  def combinations([x | xs], n) do
    for(y <- combinations(xs, n - 1), do: [x | y]) ++ combinations(xs, n)
  end

  def group_by_size(set) do
    Enum.group_by(set, &Enum.sum(&1))
    |> Enum.map(fn {_k, v} -> v end)
    |> Enum.filter(&(Enum.count(&1) >= @nr_of_elements))

    #    |> Enum.reduce([], & &1 ++ &2)
  end

  def select(set) do
    Enum.reduce(set, Map.new(), fn list, acc ->
      sum = Enum.sum(list)

      if elt = Map.get(acc, sum),
        do: Map.replace(acc, sum, [list] ++ elt),
        else: Map.put(acc, sum, [list])
    end)
    |> Enum.filter(fn {_k, v} -> Enum.count(v) == @nr_of_elements end)
    |> Enum.map(&elem(&1, 1))
  end

  @doc """
  Two things:
  1. Add frequency info to every node
  2. Filter nodes: the total frequency per 3-tuple should be @nr_of_elements.
  """
  def organize(list_of_nodes) when is_list(list_of_nodes) do
    transform(list_of_nodes, Enum.reduce(list_of_nodes, &(&1 ++ &2)) |> Enum.frequencies())
    |> Enum.filter(fn x ->
      sum(x) == 5
    end)
  end

  @doc """
  Add frequency settings to every 3-tuple
  """
  def transform([], _frequencies), do: []

  def transform([h | t], frequencies) do
    [Enum.map(h, fn elt -> {elt, Map.get(frequencies, elt)} end)] ++ transform(t, frequencies)
  end

  @doc """
  Count the number of frequencies per 3-tuple
  """
  def sum(nodes), do: Enum.reduce(nodes, 0, &(elem(&1, 1) + &2))

  def external_nodes(list) do
    combinations(list, @nr_of_elements)
    |> Enum.map(&organize/1)
    # Filter for having exactly nr_of_elements 3-tuples
    |> Enum.filter(&(Enum.count(&1) == @nr_of_elements))
  end
end
