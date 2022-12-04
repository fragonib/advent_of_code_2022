defmodule Day12 do

  def resolve(problem) do
    problem
    |> Stream.map(&Enum.sum/1)
    |> Enum.sort()
    |> Enum.take(3)
  end

  def printResults() do
    Day11.readProblem()
    |> Day12.resolve()
    |> Integer.to_string()
    |> IO.puts()
  end

end
