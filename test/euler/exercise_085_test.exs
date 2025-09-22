defmodule Euler.Exercise_085_test do
  use ExUnit.Case

  import Euler.Exercise_085

  describe "solutions/1" do
    test "returns grid area with maximum nr of rectangles within limit" do
      assert 2772 = solution()
    end
  end
end
