defmodule Euler.Exercise_078_test do
  use ExUnit.Case

  import Euler.Exercise_078

  describe "solutions/1" do
    test "returns first nr where nr of partitions is divisible by 1_000_000" do
      [{nr, _partitions}] = solution()
      assert ^nr = 55374
    end
  end
end
