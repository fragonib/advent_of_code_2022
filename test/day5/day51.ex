defmodule AoC.Day51Test do
  use ExUnit.Case
  doctest AoC.Day51
  alias AoC.Day51

  test "read problem" do
    assert Day51.readProblem() == %{
      :stacks => [
        %{ :id => 1, :stack => ["D"] },
        %{ :id => 2, :stack => ["N", "C"] },
        %{ :id => 3, :stack => ["Z", "M", "P"] }
      ],
      :movements => [
        %{ :quantity => 1, :from => 2, :to => 1 },
        %{ :quantity => 3, :from => 1, :to => 3 },
        %{ :quantity => 2, :from => 2, :to => 1 },
        %{ :quantity => 1, :from => 1, :to => 2 }
      ]
    }
  end

end
