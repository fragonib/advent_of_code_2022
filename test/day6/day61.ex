defmodule AoC.Day61Test do
  use ExUnit.Case
  doctest AoC.Day61
  alias AoC.Day61

  test "read" do
    assert Day61.readProblem() |> Enum.take_while() == "asdfghjkl"
  end

  test "resolve" do
    assert Day61.resolve(String.to_charlist("mjqjpqmgbljsphdztnvjfqwrcgsmlb")) == 7
    assert Day61.resolve(String.to_charlist("bvwbjplbgvbhsrlpgdmjqwftvncz")) == 5
    assert Day61.resolve(String.to_charlist("nppdvjthqldpwncqszvftbrmjlhg")) == 6
    assert Day61.resolve(String.to_charlist("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg")) == 10
    assert Day61.resolve(String.to_charlist("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw")) == 11
  end

end
