defmodule Euler.Exercise_100_test do
  use ExUnit.Case

  import Euler.Exercise_100

  describe "solutions/1" do
    test "returns pair with (blue disks, total disks)" do
      assert [{756_872_327_473, 1_070_379_110_497}] = solution()
    end

    test "returns pair with (total disks, blue disks)" do
      assert [{1_070_379_110_497, 756_872_327_473}] = solution2()
    end
  end
end
