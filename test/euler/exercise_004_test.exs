defmodule Euler.Exercise_004_test do
  use ExUnit.Case

  test "9009 is a palindrome", do: assert(Euler.Exercise_004.is_palindrome?(9009) == true)

  test "3 is a palindrome", do: assert(Euler.Exercise_004.is_palindrome?(3) == true)

  test "123454321 is a palindrome",
    do: assert(Euler.Exercise_004.is_palindrome?(123_454_321) == true)

  test "21 is not a palindrome", do: assert(Euler.Exercise_004.is_palindrome?(21) == false)

  test "solution(2)", do: assert(Euler.Exercise_004.solution(2) == 9009)

  test "solution(3)", do: assert(Euler.Exercise_004.solution(3) == 906_609)
end
