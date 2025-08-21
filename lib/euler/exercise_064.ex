defmodule Euler.Exercise_064 do
  @moduledoc """
  Odd Period Square Roots

  https://en.wikipedia.org/wiki/Euler%27s_continued_fraction_formula
  """

  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def solution(n \\ 10_000) do
    2..n
    |> Enum.filter(&(is_perfect_square?(&1) == false))
    |> Enum.map(fn x -> continued_fraction(x) end)
    |> Enum.map(&is_odd?/1)
    |> Enum.filter(& &1)
    |> Enum.count()
  end

  defp is_perfect_square?(n) when n >= 0 do
    root = :math.sqrt(n)
    Float.floor(root) == root
  end

  defp is_perfect_square?(_), do: false

  defp is_odd?(period) when is_list(period), do: Enum.count(period) |> rem(2) != 0
  defp is_odd?(_period), do: false

  def continued_fraction(n) do
    [a0] =
      Stream.iterate(1, &(&1 + 1))
      |> Stream.take_while(&(&1 * &1 <= n))
      |> Enum.take(-1)

    # Calculate the last number that will show up
    last = :math.sqrt(n) |> floor() |> Kernel.*(2)

    Stream.unfold({a0, 1, -a0}, fn {a, num, denom} ->
      n_new = div(n - denom * denom, num)
      a_new = ((:math.sqrt(n) - denom) / n_new) |> trunc()
      d_new = -denom - a_new * n_new

      case a == last do
        true -> nil
        false -> {{a_new, n_new, d_new}, {a_new, n_new, d_new}}
      end
    end)
    |> Stream.map(&elem(&1, 0))
    |> Enum.to_list()
  end
end
