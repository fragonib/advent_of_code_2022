defmodule AoC.Day51 do

  def readProblem do
    IO.stream(:stdio, :line)
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
  end

  def resolve(problem) do
    problem
    |> Enum.sum()
  end

  def printResults() do
    readProblem()
    |> IO.puts()
  end

end
