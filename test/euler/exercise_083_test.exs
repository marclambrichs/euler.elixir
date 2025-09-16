defmodule Euler.Exercise_083_test do
  use ExUnit.Case

  import Euler.Exercise_083

  describe "solutions/1" do
    test "returns minimal path sum from matrix" do
      assert 425185 = solution()
    end
  end
end
