defmodule AoC.Day21Test do
  use ExUnit.Case
  doctest AoC.Day31
  alias AoC.Day31

  test "read problem" do
    rucksacks = [
      "vJrwpWtwJgWrhcsFMMfFFhFp",
      "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
      "PmmdzqPrVvPwwTWBwg",
      "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
      "ttgJtRGJQctTZtZT",
      "CrZsJsPPZsGzwwsLwLmpwMDw",
    ]
    assert Day31.readProblem() == rucksacks
  end

  test "rucksack" do
    ruckskack = "vJrwpWtwJgWrhcsFMMfFFhFp"
    assert Day31.split_rucksack(ruckskack) == {
      "vJrwpWtwJgWr",
      "hcsFMMfFFhFp",
    }
  end

  test "type conversion" do
    assert Day31.type_to_integer("a") == 1
    assert Day31.type_to_integer("z") == 26
    assert Day31.type_to_integer("A") == 27
    assert Day31.type_to_integer("Z") == 52
    assert Day31.integer_to_type(1) == "a"
    assert Day31.integer_to_type(26) == "z"
    assert Day31.integer_to_type(27) == "A"
    assert Day31.integer_to_type(52) == "Z"
  end

  test "log2" do
    assert Day31.log2(1) == 0
    assert Day31.log2(8) == 3
    assert Day31.log2(64) == 6
  end

  test "annotate" do
    assert Day31.type_set("abcd") == 15
    assert Day31.type_set("effff") == 48
    assert Day31.type_set("dddd") == 8
  end

  test "violator" do
    assert Day31.violator({"abcd", "defgd"}) == 8
  end

end
