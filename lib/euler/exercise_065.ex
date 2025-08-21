defmodule Euler.Exercise_065 do
  @moduledoc """
  Convergents of e
  """

  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def solution() do
    e_numerator()
    |> Integer.digits()
    |> Enum.sum()
  end

  def e_numerator() do
    {num, den} =
      a_n()
      |> Enum.to_list()
      |> Enum.reverse()
      |> Enum.reduce({0, 1}, fn a, {n, d} ->
        {d, a * d + n}
      end)

    numerator = 2 * den + num
    IO.puts("e = #{numerator / den}")

    case rem(numerator, den) == 0 do
      true -> div(numerator, den)
      false -> numerator
    end
  end

  defp a_n() do
    Stream.unfold(1, fn
      34 -> nil
      n -> {[1, 2 * n, 1], n + 1}
    end)
    |> Enum.to_list()
    |> List.flatten()
  end
end
