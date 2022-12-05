defmodule AoC.Day21Test do
  use ExUnit.Case
  doctest AoC.Day21
  alias AoC.Day21

  test "read" do
    assert Day21.readProblem() == [
      {:rock, :paper},
      {:paper, :rock},
      {:scissors, :scissors}
    ]
  end

  test "resolve" do
    assert Day21.resolve([
      {:rock, :paper},
      {:paper, :rock},
      {:scissors, :scissors}
    ]) == 15
  end

end
