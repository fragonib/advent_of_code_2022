defmodule AoC.Day42Test do
  use ExUnit.Case
  doctest AoC.Day42
  alias AoC.Day41
  alias AoC.Day42

  test "range overlap" do
    assert Day42.ranges_overlap?({{2,8}, {3,7}}) == true
    assert Day42.ranges_overlap?({{2,8}, {3,9}}) == false
    assert Day42.ranges_overlap?({{3,7}, {2,8}}) == true
    assert Day42.ranges_overlap?({{6,6}, {4,6}}) == true
    assert Day42.ranges_overlap?({{6,6}, {4,5}}) == false
  end

  test "resolve" do
    assert Day41.resolve([
      {{ 2, 4 }, { 6, 8 }},
      {{ 2, 3 }, { 4, 5 }},
      {{ 5, 7 }, { 7, 9 }},
      {{ 2, 8 }, { 3, 7 }},
      {{ 6, 6 }, { 4, 6 }},
      {{ 2, 6 }, { 4, 8 }},
    ], &Day42.ranges_overlap?/1) == 4
  end

end
