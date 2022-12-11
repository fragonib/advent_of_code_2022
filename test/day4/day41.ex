defmodule AoC.Day41Test do
  use ExUnit.Case
  doctest AoC.Day41
  alias AoC.Day41

  test "read problem" do
    assert Day41.readProblem() == [
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
  end

  test "range overlap" do
    assert Day41.ranges_overlap?({2,8}, {3,7}) == true
    assert Day41.ranges_overlap?({2,8}, {3,9}) == false
    assert Day41.ranges_overlap?({3,7}, {2,8}) == true
    assert Day41.ranges_overlap?({6,6}, {4,6}) == true
    assert Day41.ranges_overlap?({6,6}, {4,5}) == false
  end

  test "resolve" do
    assert Day41.resolve([
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
    ]) == 2
  end

end
