defmodule Euler.Exercise_12_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds first triangle to have over 5 divisors",
      do: assert(Euler.Exercise_012.solution(5) == [28])

    # @tag timeout: :infinity
    test "finds first triangle to have over 500 divisors",
      do: assert(Euler.Exercise_012.solution() == [76_576_500])
  end
end
