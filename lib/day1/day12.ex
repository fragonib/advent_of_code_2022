defmodule AoC.Day12 do

  alias AoC.Day11

  def resolve(problem) do
    problem
    |> Stream.map(&Enum.sum/1)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum()
  end

  def printResults() do
    Day11.readProblem()
    |> resolve()
    |> Integer.to_string()
    |> IO.puts()
  end

end
