defmodule Euler.Exercise_022 do
  @moduledoc """
  Take priv/files/names.txt, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name,
  multiply this value by its alphabetical position in the list to obtain a name score.

  For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th
  name in the list. So, COLIN would obtain a score of 938 * 53 = 49714.

  What is the total of all the name scores in the file?
  """

  def solution() do
    values = values()
    names()
    |> Enum.map(fn {name, pos} -> value(name, values) * pos end)
    |> Enum.sum()
  end

  def names() do
    content = File.read!("priv/files/0022_names.txt")
    |> String.split(["\"", "\",\""])

    content
    |> Enum.slice(1..length(content) - 2)
    |> Enum.sort()
    |> Enum.with_index(&({&1, &2 + 1}))
    |> Map.new()
  end

  def values() do
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ" |> String.graphemes() |> Enum.with_index(&({&1, &2 + 1})) |> Map.new()
  end

  def value(name, values) do
    name |> String.graphemes() |> Enum.map(&(values[&1])) |> Enum.sum()
  end
end
