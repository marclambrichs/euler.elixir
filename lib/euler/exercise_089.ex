defmodule Euler.Exercise_089 do
  @moduledoc """
  Roman Numerals

  For a number written in Roman numerals to be considered valid there are basic rules which must be followed. Even though the
  rules allow some numbers to be expressed in more than one way there is always a "best" way of writing a particular number.

  Find the number of characters saved by writing each of the numbers in roman.txt in their minimal form.
  """

  alias Euler.RomanNumerals

  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def solution() do
    from_file("priv/files/0089_roman.txt")
    |> Enum.reduce(0, fn orig, acc ->
      {nr, ""} = RomanNumerals.convert(orig)
      acc + (String.length(orig) - String.length(RomanNumerals.convert(nr)))
    end)
  end

  def from_file(file) do
    file
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end

defmodule Euler.RomanNumerals do
  @mappings [
    {"M", 1000},
    {"CM", 900},
    {"D", 500},
    {"CD", 400},
    {"C", 100},
    {"XC", 90},
    {"L", 50},
    {"XL", 40},
    {"X", 10},
    {"IX", 9},
    {"V", 5},
    {"IV", 4},
    {"I", 1}
  ]

  def convert(nr) when is_integer(nr) do
    {0, str} =
      Enum.reduce(@mappings, {nr, ""}, fn {roman, arabic}, {nr, str} ->
        {rem(nr, arabic), str <> String.duplicate(roman, div(nr, arabic))}
      end)

    str
  end

  def convert(str) when is_binary(str) do
    Enum.reduce(@mappings, {0, str}, fn {roman, arabic}, {nr, str} ->
      times =
        case Regex.run(~r/^#{roman}+/, str) do
          nil -> 0
          [substr] -> div(String.length(substr), String.length(roman))
        end
      {nr + times * arabic,
       String.replace(str, String.duplicate(roman, times), "", global: false)}
    end)
  end
end
