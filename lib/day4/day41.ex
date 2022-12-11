defmodule AoC.Day41 do

  def readProblem do
    IO.stream(:stdio, :line)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&readPair/1)
    |> Enum.to_list()
    |> List.flatten()
  end

  def readPair(line) do
    String.split(line, ",", trim: true)
    |> Enum.map(&readRange/1)
  end

  def readRange(pairLiteral) do
    String.split(pairLiteral, "-", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple()
  end

  def resolve(problem) do
    problem
    |> Enum.sum()
  end

  def printResults() do
    readProblem()
    |> resolve()
    |> Integer.to_string()
    |> IO.puts()
  end

end
