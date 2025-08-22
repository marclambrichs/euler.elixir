defmodule Euler.Exercise_080_test do
  use ExUnit.Case

  import Euler.Exercise_080

  describe "solutions/1" do
    test "returns total of the digital sums of the first 100 decimal digits for all irrational square roots" do
      assert 40886 = solution()
    end
  end
end
