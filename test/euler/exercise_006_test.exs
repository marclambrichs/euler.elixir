defmodule Euler.Exercise_006_test do
  use ExUnit.Case

  describe "solution/1" do
    test "find difference between sos and qos for first 10 natural numbers",
      do: assert(Euler.Exercise_006.solution(10) == 2640)

    test "find difference between sos and qos for first 100 natural numbers",
      do: assert(Euler.Exercise_006.solution() == 25_164_150)
  end

  describe "sum_of_squares/1" do
    test "finds sum of squares of first 10 natural numbers",
      do: assert(Euler.Exercise_006.sum_of_squares(10) == 385)

    test "finds sum of squares of first 100 natural numbers",
      do: assert(Euler.Exercise_006.sum_of_squares(100) == 338_350)
  end

  describe "square_of_sums/1" do
    test "finds square of sums of first 10 natural numbers",
      do: assert(Euler.Exercise_006.square_of_sum(10) == 3025)

    test "finds square of sums of first 100 natural numbers",
      do: assert(Euler.Exercise_006.square_of_sum(100) == 25_502_500)
  end
end
