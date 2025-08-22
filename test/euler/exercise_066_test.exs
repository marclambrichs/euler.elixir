defmodule Euler.Exercise_066_test do
  use ExUnit.Case

  import Euler.Exercise_066

  describe "solutions/1" do
    test "returns D with largest value in minimal solutions Diophantine equation" do
      assert {661,
              {16_421_658_242_965_910_275_055_840_472_270_471_049,
               638_728_478_116_949_861_246_791_167_518_480_580}} = solution()
    end
  end
end
