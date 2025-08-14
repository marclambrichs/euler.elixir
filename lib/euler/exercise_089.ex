defmodule Euler.Exercise_089 do
  @moduledoc """
  Passcode derivation

  A common security method used for online banking is to ask the user for three random characters from a passcode. For example,
  if the passcode was 531278, they may ask for the 2nd, 3rd, and 5th characters; the expected reply would be: 317.

  The text file, keylog.txt, contains fifty successful login attempts.

  Given that the three characters are always asked for in order, analyse the file so as to determine the shortest possible secret passcode of unknown length.
  """

  def timer(), do: :timer.tc(__MODULE__, :solution, [])

  def solution() do
    from_file("priv/files/0079_keylog.txt")
  end

  def from_file(file) do
    file
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
