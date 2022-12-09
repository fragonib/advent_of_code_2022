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

  test "Type conversion" do
    assert Day31.type_to_integer("a") == 1
    assert Day31.type_to_integer("z") == 26
    assert Day31.type_to_integer("A") == 27
    assert Day31.type_to_integer("Z") == 52
    assert Day31.integer_to_type(1) == "a"
    assert Day31.integer_to_type(26) == "z"
    assert Day31.integer_to_type(27) == "A"
    assert Day31.integer_to_type(52) == "Z"
  end

  test "Type set" do
    assert Day31.type_set("abcd") == 15
    assert Day31.type_set("effff") == 48
    assert Day31.type_set("dddd") == 8
  end

  test "Type violator" do
    assert Day31.violator({"vJrwpWtwJgWr", "hcsFMMfFFhFp"}) == "p"
    assert Day31.violator({"jqHRNqRjqzjGDLGL", "rsFMfFZSrLrFZsSL"}) == "L"
    assert Day31.violator({"PmmdzqPrV", "vPwwTWBwg"}) == "P"
    assert Day31.violator({"wMqvLMZHhHMvwLH", "jbvcjnnSBnvTQFn"}) == "v"
    assert Day31.violator({"ttgJtRGJ", "QctTZtZT"}) == "t"
    assert Day31.violator({"CrZsJsPPZsGz", "wwsLwLmpwMDw"}) == "s"
  end

  test "Resolve" do
    rucksacks = [
      "vJrwpWtwJgWrhcsFMMfFFhFp",
      "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
      "PmmdzqPrVvPwwTWBwg",
      "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
      "ttgJtRGJQctTZtZT",
      "CrZsJsPPZsGzwwsLwLmpwMDw",
    ]
    assert Day31.resolve(rucksacks) == 157
  end

end
