defmodule Euler.Exercise_089_test do
  use ExUnit.Case

  import Euler.Exercise_089

  describe "solutions/1" do
    test "returns total saved nr of chars" do
      assert 743 = solution()
    end
  end
end
