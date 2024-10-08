defmodule Euler.Exercise_025 do
  @moduledoc """
  Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with
  1 and 2, the first 10 terms will be
    1, 2, 3, 5, 8, 13, 21, 34, 55, 89, .....

  The 12th term, F12, is the first term to contain three digits.
  What is the index of the first term in the Fibonacci sequence to contain 1000 digits?
  """

  @spec solution_old(non_neg_integer()) :: non_neg_integer()
  def solution_old(limit \\ 1_000) do
    Stream.iterate(0, &(&1 + 1))
    |> Stream.map(&fib(&1))
    |> Stream.take_while(&(digits(&1) < limit))
    |> Enum.count()
  end

  @spec solution(non_neg_integer()) :: non_neg_integer()
  def solution(limit \\ 1_000) do
    fibonacci()
    |> Stream.take_while(&(digits(&1) < limit))
    |> Enum.count()
  end

  defp fib(0), do: 0
  defp fib(1), do: 1
  defp fib(n), do: fib(n - 2) + fib(n - 1)

  # nicer - and faster:
  def fibonacci(), do: Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
  # or:
  # def fibonacci(), do: Stream.unfold({0, 1}, &({&1, {&2, &1 + &2}}))

  @spec digits(non_neg_integer()) :: non_neg_integer()
  def digits(n), do: n |> Integer.digits() |> length
end
