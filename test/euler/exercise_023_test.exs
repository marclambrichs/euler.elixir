defmodule Euler.Exercise_23_test do
  use ExUnit.Case

  describe "solution/1" do
    test "finds correct solution",
      do: assert(Euler.Exercise_023.solution() == 4_179_871)
  end
end
