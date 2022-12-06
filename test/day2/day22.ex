defmodule AoC.Day21Test do
  use ExUnit.Case
  doctest AoC.Day22
  alias AoC.Day22

  test "read" do
    assert Day22.readProblem() == [
      {:rock, :draw},
      {:paper, :lose},
      {:scissors, :win}
    ]
  end

  test "resolve" do
    assert Day22.resolve([
      {:rock, :draw},
      {:paper, :lose},
      {:scissors, :win}
    ]) == 12
  end

end
