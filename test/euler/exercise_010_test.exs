defmodule Euler.Exercise_010_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds sum of primes below 10",
      do: assert(Euler.Exercise_010.solution(10) == 17)

    test "finds sum of primes below 2_000_000",
      do: assert(Euler.Exercise_010.solution() == 142_913_828_922)
  end
end
