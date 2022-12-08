defmodule AoC.Day21Test do
  use ExUnit.Case
  doctest AoC.Day31
  alias AoC.Day31

  test "read" do
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

  test "priority" do
    assert Day31.priority("a") == 1
    assert Day31.priority("b") == 2
    assert Day31.priority("c") == 3
    assert Day31.priority("d") == 4
    assert Day31.priority("z") == 26
    assert Day31.priority("A") == 27
    assert Day31.priority("Z") == 52
  end

  test "annotate" do
    assert Day31.annotate("abcd") == 15
  end

end
