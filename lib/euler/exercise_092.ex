defmodule Euler.Exercise_092 do
  @moduledoc """
  Square Digit Chains

  """

  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def solution() do
    chains()
    |> Stream.filter(& &1 == 89)
    |> Enum.count()
  end

  def chains() do
    Stream.unfold(1, fn
      10_000_000 -> nil
      n -> {n, n + 1}
    end)
    |> Stream.map(&chain/1)
  end

  def chain(nil), do: nil
  def chain(1), do: 1
  def chain(89), do: 89

  def chain(n) do
    Integer.digits(n)
    |> Enum.map(&(&1 * &1))
    |> Enum.sum()
    |> chain()
  end
end
