defmodule Euler.Exercise_070_test do
  use ExUnit.Case

  import Euler.Exercise_070

  describe "solutions/1" do
    test "return minimum n/φ(n)" do
      assert {8_319_823, 8_313_928} = solution()
    end
  end
end
