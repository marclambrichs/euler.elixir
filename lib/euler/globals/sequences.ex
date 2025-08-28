defmodule Euler.Globals.Sequences do
  defmodule Pascal do
    def stream, do: Stream.unfold([1], &next/1)

    defp next(list) do
      list
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.map(&Enum.sum/1)
      |> (fn a -> {list, [1] ++ a ++ [1]} end).()
    end
  end

  defmodule Sieve do
    @moduledoc """
    Sieve of Ερατοσθενους
    """
    def take(n), do: stream() |> Enum.take(n)
    def upto(n), do: stream() |> Enum.take_while(&(&1 <= n))

    def stream() do
      Stream.unfold([], fn
        [] -> {2, [2]}
        [h | t] -> next(h + 1, [h | t])
      end)
    end

    def next(n, primes) do
      if Enum.any?(primes, &(rem(n, &1) == 0)) do
        next(n + 1, primes)
      else
        {n, [n | primes]}
      end
    end
  end
end
