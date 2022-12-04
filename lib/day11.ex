defmodule Day11 do

  def parseCalory("") do :next end
  def parseCalory(n) do String.to_integer(n) end

  def readProblem do
    IO.stream(:stdio, :line)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&(parseCalory/1))
    |> Enum.chunk_by(&(&1 != :next))
    |> Enum.reject(&(&1 == [:next]))
  end

  def resolve(problem) do
    problem
    |> Stream.map(&Enum.sum/1)
    |> Enum.to_list()
    |> Enum.max()
  end

  def printResults() do
    readProblem()
    |> resolve()
    |> Integer.to_string()
    |> IO.puts()
  end

end
