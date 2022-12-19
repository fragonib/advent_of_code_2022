defmodule AoC.Day51Test do
  use ExUnit.Case
  doctest AoC.Day51
  alias AoC.Day51

  test "read problem" do
    assert Day51.readProblem() == %{
      :stacks => [
        ["N", "Z"],
        ["D", "C", "M"],
        ["P"],
      ],
      :movements => [
        %{ "quantity" => 1, "from" => 2, "to" => 1 },
        %{ "quantity" => 3, "from" => 1, "to" => 3 },
        %{ "quantity" => 2, "from" => 2, "to" => 1 },
        %{ "quantity" => 1, "from" => 1, "to" => 2 }
      ]
    }
  end

  test "resolve" do
    assert Day51.resolve(%{
      :stacks => [
        ["N", "Z"],
        ["D", "C", "M"],
        ["P"],
      ],
      :movements => [
        %{ "quantity" => 1, "from" => 2, "to" => 1 },
        %{ "quantity" => 3, "from" => 1, "to" => 3 },
        %{ "quantity" => 2, "from" => 2, "to" => 1 },
        %{ "quantity" => 1, "from" => 1, "to" => 2 }
      ]
    }, &Day51.movement/2) == "CMZ"

  end

end
