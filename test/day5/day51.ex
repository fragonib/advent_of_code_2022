defmodule AoC.Day51Test do
  use ExUnit.Case
  doctest AoC.Day51
  alias AoC.Day51

  test "read problem" do
    assert Day51.readProblem() == [
      "[D]", "[N] [C]", "[Z] [M] [P]", "1   2   3", "", "move 1 from 2 to 1", "move 3 from 1 to 3", "move 2 from 2 to 1", "move 1 from 1 to 2"
    ]
  end

end
