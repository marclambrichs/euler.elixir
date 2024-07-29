defmodule Euler.Exercise_010_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds the first fibonacci term with 3 digits",
      do: assert(Euler.Exercise_025.solution(3) == 12)

    test "finds the first fibonacci term with 1000 digits",
      do: assert(Euler.Exercise_025.solution(1000) == 4782)
  end

  describe "digits/1" do
    test "return nr of digits of 1", do: assert(Euler.Exercise_025.digits(1) == 1)

    test "return nr of digits of 12345", do: assert(Euler.Exercise_025.digits(12345) == 5)

    test "return nr of digits of 1234567890",
      do: assert(Euler.Exercise_025.digits(1_234_567_890) == 10)
  end
end
