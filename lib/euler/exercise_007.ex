defmodule Euler.Exercise_007 do
  @moduledoc """
  By listing the first six prime numbers: 2, 3, 5, 7, 11 and 13,
  we can see that the 6th prime is 13.
  What is the 10.001th prime?
  """

  import Euler.Globals

  def solution(n \\ 10_001) do
    n_primes(n) |> Enum.fetch!(-1)
  end
end
