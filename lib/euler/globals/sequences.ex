defmodule Euler.Globals.Sequences do
  defmodule Farey do
    def stream() do
      Stream.unfold({{0, 1}, {1, 1}, 1}, fn {{a, b}, {c, d}, n} ->
        next([{a, b}, {c, d}], n)
      end)
    end

    def next([{a, b}, {c, d}], layer) when c <= layer do
      k = Integer.floor_div(layer + b, d)
      {{a, b}, {{c, d}, {k * c - a, k * d - b}, layer}}
    end

    def next([{a, b}, {c, d}], layer) do
      k = Integer.floor_div(layer + 1 + b, d)
      {{a, b}, {{c, d}, {k * c - a, k * d - b}, layer + 1}}
    end
  end

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

    def primefactors(n) do
      upto(n)
      |> Stream.filter(&(rem(n, &1) == 0))
      |> Enum.to_list()
    end
  end
end
