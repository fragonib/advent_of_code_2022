defmodule AoC.Day62Test do
  use ExUnit.Case
  doctest AoC.Day62
  alias AoC.Day61
  alias AoC.Day62

  test "resolve" do
    assert Day61.resolve(String.to_charlist("mjqjpqmgbljsphdztnvjfqwrcgsmlb"), 14) == 19
    assert Day61.resolve(String.to_charlist("bvwbjplbgvbhsrlpgdmjqwftvncz"), 14) == 23
    assert Day61.resolve(String.to_charlist("nppdvjthqldpwncqszvftbrmjlhg"), 14) == 23
    assert Day61.resolve(String.to_charlist("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"), 14) == 29
    assert Day61.resolve(String.to_charlist("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"), 14) == 26
  end

end
