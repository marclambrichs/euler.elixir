defmodule Euler.Exercise_050_test do
  use ExUnit.Case

  import Euler.Exercise_050

  describe "solution/1" do
#    @tag :skip
    test "returns max prime, smaller than n, writable as sum of consecutive primes" do
      assert {13, 41, 6} = solution(100)
      assert {89, 953, 21} = solution(1000)
    end
  end
end
