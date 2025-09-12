defmodule Euler.Exercise_073_test do
  use ExUnit.Case

  import Euler.Exercise_073

  describe "solutions/1" do
    test "return nr of fractoins between 1/3 and 1/2 for d <= 12000" do
      assert 7295372 = solution()
    end
  end
end
