defmodule Euler.Exercise_076_test do
  use ExUnit.Case

  import Euler.Exercise_076

  describe "solutions/1" do
    test "returns nr of ways 100 can be written as sum of two pos integers" do
      assert [190_569_291] = solution()
    end
  end
end
