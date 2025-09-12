defmodule Euler.Exercise_071_test do
  use ExUnit.Case

  import Euler.Exercise_071

  describe "solutions/1" do
    test "return maximum fraction left to 3/7" do
      assert [{428570, 999997}] = solution()
    end
  end
end
