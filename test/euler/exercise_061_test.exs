defmodule Euler.Exercise_061_test do
  use ExUnit.Case

  import Euler.Exercise_061

  describe "triangle/0" do
    @tag :skip
    test "returns 5 first items of triangle function" do
      assert [1035, 1081, 1128, 1176, 1225] = triangle() |> Enum.take(5)
    end
  end

  describe "square/0" do
    @tag :skip
    test "returns 5 first items of square function" do
      assert [1024, 1089, 1156, 1225, 1296] = square() |> Enum.take(5)
    end
  end

  describe "pentagonal/0" do
    @tag :skip
    test "returns 5 first items of pentagonal function" do
      assert [1001, 1080, 1162, 1247, 1335] = pentagonal() |> Enum.take(5)
    end
  end

  describe "hexagonal/0" do
    @tag :skip
    test "returns 5 first items of hexagonal function" do
      assert [1035, 1128, 1225, 1326, 1431] = hexagonal() |> Enum.take(5)
    end
  end

  describe "heptagonal/0" do
    @tag :skip
    test "returns 5 first items of heptagonal function" do
      assert [1071, 1177, 1288, 1404, 1525] = heptagonal() |> Enum.take(5)
    end
  end

  describe "octogonal/0" do
    @tag :skip
    test "returns 5 first items of octogonal function" do
      assert [1045, 1160, 1281, 1408, 1541] = octogonal() |> Enum.take(5)
    end
  end
end
