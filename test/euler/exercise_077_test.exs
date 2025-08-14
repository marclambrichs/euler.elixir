defmodule Euler.Exercise_077_test do
  use ExUnit.Case

  import Euler.Exercise_077

  describe "solutions/1" do
    test "returns tuple {value, total} where value can be written as sum of primes in total ways" do
      assert [{71, 5006}] = solution()
    end
  end
end
