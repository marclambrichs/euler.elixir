defmodule Euler.Exercise_004 do
  @moduledoc """
  A palindromic number reads the same both ways. The largest palindrome made from the product of
  two 2-digit numbers is 9009 = 91 x 99.

  Find the largest palindrome made from the product of two 3-digit numbers.
  """
  def is_palindrome?(nr) when is_integer(nr), do: is_palindrome?(Integer.to_charlist(nr))

  def is_palindrome?(nr) when is_list(nr) do
    nr == Enum.reverse(nr)
  end

  def solution(nr_of_chars) do
    range =
      (String.duplicate("9", nr_of_chars) |> String.to_integer())..(String.duplicate(
                                                                      "1",
                                                                      nr_of_chars
                                                                    )
                                                                    |> String.to_integer())

    Stream.flat_map(range, fn x -> Stream.map(range, fn y -> x * y end) end)
    |> Enum.filter(fn x -> is_palindrome?(x) end)
    |> Enum.reduce(fn x, acc -> if x > acc, do: x, else: acc end)
  end
end
