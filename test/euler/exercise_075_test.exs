defmodule Euler.Exercise_075_test do
  use ExUnit.Case

  import Euler.Exercise_075

  describe "solutions/1" do
    test "return nr of lengths that are the sum of pythagorean triples" do
      assert 161667 = solution()
    end
  end
end
