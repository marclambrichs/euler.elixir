defmodule Euler.Exercise_079 do
  @moduledoc """
  Passcode derivation

  A common security method used for online banking is to ask the user for three random characters from a passcode. For example,
  if the passcode was 531278, they may ask for the 2nd, 3rd, and 5th characters; the expected reply would be: 317.

  The text file, keylog.txt, contains fifty successful login attempts.

  Given that the three characters are always asked for in order, analyse the file so as to determine the shortest possible secret passcode of unknown length.

  First solution, in Euler.Password, is not a satisfactory one. Another solution can be found in Euler.Password2.
  """
  alias Euler.Password
  alias Euler.Password2

  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def solution() do
    from_file("priv/files/0079_keylog.txt")
    |> Password.filter()
  end

  def solution2() do
    from_file("priv/files/0079_keylog.txt")
    |> Password2.filter()
  end

  def from_file(file) do
    file
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end

defmodule Euler.Password do
  defp firsts(attempts) do
    Enum.map(attempts, &String.codepoints/1)
    |> Enum.map(&Enum.take(&1, 1))
    |> Enum.uniq()
    |> List.flatten()
  end

  defp tails(attempts) do
    attempts
    |> Enum.map(&String.slice(&1, 1..-1//1))
  end

  @spec filter(any()) :: any()
  def filter(attempts, acc \\ "")
  def filter([], acc), do: acc

  def filter(attempts, acc) do
    tails = tails(attempts)

    [first] =
      firsts(attempts)
      |> Enum.filter(fn x -> Enum.all?(tails, fn y -> !String.contains?(y, x) end) end)

    # Remove firsts from front of all attempts it appears in
    filter(
      attempts |> Enum.map(&String.replace(&1, ~r/^#{first}/, "")) |> Enum.filter(&(&1 != "")),
      acc <> first
    )
  end
end

defmodule Euler.Password2 do
  def filter(attempts) do
    attempts
    |> Enum.join()
    |> String.codepoints()
    |> Enum.with_index()
    |> Enum.reduce(%{}, fn {x, pos}, acc ->
      if Map.has_key?(acc, x) do
        Map.update!(acc, x, &(&1 ++ [rem(pos, 3)]))
      else
        Map.put(acc, x, [rem(pos, 3)])
      end
    end)
    |> Enum.map(fn {k, v} -> {k, Enum.sum(v) / length(v)} end)
    |> Enum.sort_by(&elem(&1, 1))
    |> Enum.map(fn {k, _v} -> k end)
    |> Enum.join()
  end
end
