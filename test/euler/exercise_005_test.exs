defmodule Euler.Exercise_005_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds 2520 is smallest number divisible by 1..10",
      do: assert(Euler.Exercise_005.solution(10) == 2520)

    @tag :skip
    test "finds 232792560 is smallest number divisible by 1..20",
      do: assert(Euler.Exercise_005.solution() == 232_792_560)
  end

  describe "divisible?/2" do
    test "finds 2520 is divisible by all numbers in 1..10" do
      assert Euler.Exercise_005.divisible?(2520, 1..10) == true
    end

    test "finds 2519 is not divisble by all numbers in 1..10" do
      assert Euler.Exercise_005.divisible?(2519, 1..10) == false
    end
  end
end
