defmodule Euler.Exercise_092_test do
  use ExUnit.Case

  import Euler.Exercise_092

  describe "solutions/1" do
    test "returns nr of chains arrive at 89" do
      assert 8581146 = solution()
    end
  end
end
