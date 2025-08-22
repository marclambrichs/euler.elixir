defmodule Euler.Exercise_066 do
  @moduledoc """
  Convergents of e
  Diophantine Equation

  Consider quadratic Diophantine equations of the form:
  x ** 2 - D * y ** 2 = 1

  For example, when D = 13, the minimal solution in x is 649 ** 2 - 130 * 180 ** 2 = 1.

  It can be assumed that there are no solutions in positive integers when D is square.

  Find the value of D <= 1000 in minimal solutions of x
  for which the largest value of x is obtained.

  https://en.wikipedia.org/wiki/Pell%27s_equation
  Nicked the period function from exercise 64.
  """
  alias Euler.Globals

  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def solution(n \\ 1000) do
    1..n
    |> Enum.filter(&(!Globals.is_perfect_square?(&1)))
    |> Enum.map(fn a -> {a, fraction(a)} end)
    |> Enum.max_by(fn {_, {_n, d}} -> d end)
  end

  def pells_period(a) when is_list(a) do
    length = Enum.count(a)

    if has_odd_length?(a) do
      Enum.concat(a, a)
      |> Enum.take(2 * length - 1)
    else
      Enum.take(a, length - 1)
    end
  end

  def fraction(n) do
    base = floor(:math.sqrt(n))

    {fraction_num, fraction_denom} =
      period(n)
      |> pells_period()
      |> Enum.reverse()
      |> Enum.reduce({0, 1}, fn x, {n, d} ->
        if n == 0, do: {1, x}, else: {d, x * d + n}
      end)

    numerator = base * fraction_denom + fraction_num

    if rem(numerator, fraction_denom) == 0 do
      {div(numerator, fraction_denom), 1}
    else
      {numerator, fraction_denom}
    end
  end

  defp has_odd_length?(period) when is_list(period), do: Enum.count(period) |> rem(2) != 0
  defp has_odd_length?(_period), do: false

  def period(n) do
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
