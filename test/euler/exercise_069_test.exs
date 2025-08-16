defmodule Euler.Exercise_069_test do
  use ExUnit.Case

  import Euler.Exercise_069

  describe "solutions/1" do
    test "return totient maximum" do
      assert {30030, 5.213541666666666} = solution(100_000)
    end
  end
end
