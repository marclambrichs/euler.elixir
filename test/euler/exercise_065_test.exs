defmodule Euler.Exercise_065_test do
  use ExUnit.Case

  import Euler.Exercise_065

  describe "solutions/1" do
    test "returns sum of digits in the numerator of 1006h convergent" do
      assert 272 = solution()
    end
  end
end
