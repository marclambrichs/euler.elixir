defmodule Euler.Exercise_074_test do
  use ExUnit.Case

  import Euler.Exercise_074

  describe "solutions/1" do
    test "return nr of chains with exactly 60 members" do
      assert 402 = solution()
    end
  end
end
