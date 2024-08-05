defmodule Euler.Exercise_008_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds the correct product for 4 digits",
      do: assert(Euler.Exercise_009.solution(4) == {[9, 9, 8, 9], 5832})

    test "finds the correct product for 13 digits",
      do:
        assert(
          Euler.Exercise_009.solution() ==
            {[5, 5, 7, 6, 6, 8, 9, 6, 6, 4, 8, 9, 5], 23_514_624_000}
        )
  end
end
