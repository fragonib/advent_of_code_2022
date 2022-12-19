defmodule AoC.Day61Test do
  use ExUnit.Case
  doctest AoC.Day61
  alias AoC.Day61

  test "read" do
    assert Day61.readProblem() |> Enum.to_list() == ["a","s","d","f","g","h","j","k","l"]
  end

  test "resolve" do
    assert Day61.resolve(String.to_charlist("mjqjpqmgbljsphdztnvjfqwrcgsmlb"), 4) == 7
    assert Day61.resolve(String.to_charlist("bvwbjplbgvbhsrlpgdmjqwftvncz"), 4) == 5
    assert Day61.resolve(String.to_charlist("nppdvjthqldpwncqszvftbrmjlhg"), 4) == 6
    assert Day61.resolve(String.to_charlist("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"), 4) == 10
    assert Day61.resolve(String.to_charlist("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"), 4) == 11
  end

end
