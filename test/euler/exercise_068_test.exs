defmodule Euler.Exercise_068_test do
  use ExUnit.Case

  import Euler.Exercise_068

  describe "solutions/1" do
    test "returns maximum 16-digit string" do
      assert ["6531031914842725"] = solution()
    end
  end
end
