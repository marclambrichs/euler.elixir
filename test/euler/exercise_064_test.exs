defmodule Euler.Exercise_064_test do
  use ExUnit.Case

  import Euler.Exercise_064

  describe "solutions/1" do
    test "returns nr of continued fractions for N <= 10_000 that have an odd period" do
      assert 1322 = solution()
    end
  end
end
