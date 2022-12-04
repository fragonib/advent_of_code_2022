defmodule AoC.Day11Test do
  use ExUnit.Case
  doctest AoC.Day11

  test "read" do
    assert AoC.Day11.readProblem() == [
      [1000, 2000, 3000],
      [4000],
      [5000, 6000],
      [7000, 8000, 9000],
      [10000]
    ]
  end


  test "resolve" do
    assert AoC.Day11.resolve([
      [1000, 2000, 3000],
      [4000],
      [5000, 6000],
      [7000, 8000, 9000],
      [10000]
    ]) == 24000
  end

end
