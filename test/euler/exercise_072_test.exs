defmodule Euler.Exercise_072_test do
  use ExUnit.Case

  import Euler.Exercise_072

  describe "solutions/1" do
    test "return nr of proper fractions for d <= 8" do
      assert 21.0 = solution(8)
    end
  end
end
