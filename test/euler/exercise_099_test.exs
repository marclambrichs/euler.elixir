defmodule Euler.Exercise_099_test do
  use ExUnit.Case

  import Euler.Exercise_099

  describe "solutions/1" do
    test "returns last 10 digits of non-mersenne prime" do
      assert [{709, 895_447, 504_922}] = solution()
    end
  end
end
