defmodule Euler.Exercise_079_test do
  use ExUnit.Case

  import Euler.Exercise_079

  describe "solutions/1" do
    test "returns maximum total" do
      assert "73162890" = solution()
    end
  end
end
