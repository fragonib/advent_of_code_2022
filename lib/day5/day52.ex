defmodule AoC.Day52 do

  alias AoC.Day51

  def movement(movement, stacks) do
    %{"quantity" => q, "from" => f, "to" => t} = movement
    source = Enum.at(stacks, f - 1) |> Enum.drop(q)
    crapes = Enum.at(stacks, f - 1) |> Enum.take(q)
    target = crapes ++ Enum.at(stacks, t - 1)
    List.replace_at(stacks, f - 1, source)
    |> List.replace_at(t - 1, target)
  end

  def printResults() do
    Day51.readProblem()
    |> Day51.resolve(&movement/2)
    |> IO.puts()
  end

end
