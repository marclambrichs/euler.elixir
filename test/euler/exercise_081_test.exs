defmodule Euler.Exercise_081_test do
  use ExUnit.Case

  import Euler.Exercise_081

  describe "solutions/1" do
    test "returns minimal path sum" do
      assert 427_337 = solution()
    end
  end
end
