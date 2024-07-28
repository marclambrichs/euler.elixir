defmodule Euler.Exercise_003_test do
  use ExUnit.Case

  test "solution is 6_857" do
    assert Euler.Exercise_003.solution() == 6_857
  end

  test "solution(13195) is 29" do
    assert Euler.Exercise_003.solution(13_195) == 29
  end
end
