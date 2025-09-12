defmodule Euler.Exercise_082_test do
  use ExUnit.Case

  import Euler.Exercise_082

  describe "solutions/1" do
    test "returns minimal path sum from small matrix" do
      assert 994 = solution()
    end
  end
end
