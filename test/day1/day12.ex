defmodule AoC.Day12Test do
  use ExUnit.Case
  doctest AoC.Day12

  test "resolve" do
    assert AoC.Day12.resolve([
      [1000, 2000, 3000],
      [4000],
      [5000, 6000],
      [7000, 8000, 9000],
      [10000]
    ]) == 45000
  end

end
