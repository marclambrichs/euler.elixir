defmodule Euler.Exercise_078_test do
  use ExUnit.Case

  import Euler.Exercise_078

  describe "solutions/1" do
    test "returns first nr where nr of partitions is divisible by 1_000_000" do
      [{solution, _partitions}] = solution()
      assert solution = 55374
    end
  end
end
