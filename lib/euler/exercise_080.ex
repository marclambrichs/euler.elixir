defmodule Euler.Exercise_080 do
  @moduledoc """
  Square Root Digital Expansion

  For the first 100 natural numbers, find the total of the digital sums of the first 100 decimal digits for
  all the irrational square roots.
  """
  alias Decimal, as: D
  alias Euler.Globals

  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def solution() do
    1..1000
    |> Enum.filter(&(!Globals.is_perfect_square?(&1)))
    |> Enum.flat_map(&heron/1)
    |> Enum.map(fn x -> D.to_string(x) end)
    |> Enum.map(fn x ->
      String.replace(x, ~r/\./, "")
      |> String.to_integer()
      |> Integer.digits()
      |> Enum.take(100)
      |> Enum.sum()
    end)
    |> Enum.sum()
  end

  @doc """
  https://en.wikipedia.org/wiki/Square_root_algorithms#Heron's_method
  """
  def heron(n) do
    start = floor(:math.sqrt(n))
    D.Context.set(%D.Context{D.Context.get() | rounding: :half_up, precision: 150})
    dn = D.new(n)

    Stream.unfold({D.new(start), 0}, fn {x, prev} ->
      if D.equal?(prev, x) do
        nil
      else
        new = D.div(D.add(D.div(dn, x), x), 2)
        {new, {new, x}}
      end
    end)
    |> Enum.take(-1)
  end
end
