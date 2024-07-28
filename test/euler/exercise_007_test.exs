defmodule Euler.Exercise_007_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds 13 is the 6th prime",
      do: assert(Euler.Exercise_007.solution(6) == 13)

    test "finds 104743 is the 10001th prime", do: assert(Euler.Exercise_007.solution() == 104_743)
  end
end
