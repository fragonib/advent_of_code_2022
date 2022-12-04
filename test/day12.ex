defmodule Day12 do
  use ExUnit.Case
  doctest Day12

  test "resolve" do
    assert Day11.resolve([
      [1000, 2000, 3000],
      [4000],
      [5000, 6000],
      [7000, 8000, 9000],
      [10000]
    ]) == 24000
  end

end
