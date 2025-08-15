defmodule Euler.Exercise_097 do
  @moduledoc """
  Large Non-Mersenne Prime

  """

  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def solution() do
    Stream.unfold({1, 28_433}, fn
      {7_830_458, _acc} ->
        nil

      {count, acc} ->
        res = rem(acc * 2, 10_000_000_000)
        {res, {count + 1, res}}
    end)
    |> Enum.take(-1)
    |> Enum.map(&(&1 + 1))
  end
end
