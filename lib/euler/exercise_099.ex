defmodule Euler.Exercise_099 do
  @moduledoc """
  Largest Exponential

  Using base_exp.txt (right click and 'Save Link/Target As...'), a 22K text file containing one thousand lines with a base/exponent pair
  on each line, determine which line number has the greatest numerical value.
  """

  def timer(), do: :timer.tc(__MODULE__, :solution, [])
  def timer2(), do: :timer.tc(__MODULE__, :solution2, [])

  def solution() do
    from_file("priv/files/0099_base_exp.txt")
    |> Stream.scan({0, 0, 0}, fn {line, [base2, pow2]}, {_, base1, pow1} = acc ->
      cond do
        pow1 == 0 -> {line, base2, pow2}
        pow1 < pow2 -> if base1 > base2 ** (pow2 / pow1), do: acc, else: {line, base2, pow2}
        pow1 > pow2 -> if base2 > base1 ** (pow1 / pow2), do: {line, base2, pow2}, else: acc
        pow1 == pow2 -> if base1 > base2, do: acc, else: {line, base2, pow2}
      end
    end)
    |> Enum.take(-1)
  end

  @doc """
  Use logarithms.
  """
  def solution2() do
    from_file("priv/files/0099_base_exp.txt")
    |> Stream.scan({0, 1, 0}, fn {line, [base2, pow2]}, {_, base1, pow1} = acc ->
      if pow2 * :math.log(base2) > pow1 * :math.log(base1), do: {line, base2, pow2}, else: acc
    end)
    |> Enum.take(-1)
  end

  def from_file(file) do
    elts =
      file
      |> File.stream!()
      |> Stream.map(&String.trim/1)
      |> Stream.map(fn x ->
        String.split(x, ",") |> Enum.map(fn x -> String.to_integer(x) end)
      end)

    Stream.zip(1..1000, elts)
  end
end
