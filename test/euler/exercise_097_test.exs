defmodule Euler.Exercise_097_test do
  use ExUnit.Case

  import Euler.Exercise_097

  describe "solutions/1" do
    test "returns last 10 digits of non-mersenne prime" do
      assert [8_739_992_577] = solution()
    end
  end
end
