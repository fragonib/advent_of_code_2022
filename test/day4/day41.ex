defmodule AoC.Day41Test do
  use ExUnit.Case
  doctest AoC.Day41
  alias AoC.Day41

  test "read problem" do
    ranges = [
      { 2, 4 },
      { 6, 8 },
      { 2, 3 },
      { 4, 5 },
      { 5, 7 },
      { 7, 9 },
      { 2, 8 },
      { 3, 7 },
      { 6, 6 },
      { 4, 6 },
      { 2, 6 },
      { 4, 8 },
    ]
    assert Day41.readProblem() == ranges
  end

  test "resolve" do
    ranges = [
      { 2, 4 },
      { 6, 8 },
      { 2, 3 },
      { 4, 5 },
      { 5, 7 },
      { 7, 9 },
      { 2, 8 },
      { 3, 7 },
      { 6, 6 },
      { 4, 6 },
      { 2, 6 },
      { 4, 8 },
    ]
    assert Day41.resolve(ranges) == 2
  end

end
