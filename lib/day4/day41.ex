defmodule AoC.Day41 do

  def readProblem do
    IO.stream(:stdio, :line)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&readPair/1)
    |> Enum.to_list()
  end

  def readPair(line) do
    String.split(line, ",", trim: true)
    |> Enum.map(&readRange/1)
    |> List.to_tuple()
  end

  def readRange(pairLiteral) do
    String.split(pairLiteral, "-", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple()
  end

  def resolve(problem, range_pair_comparator) do
    problem
    |> Enum.map(range_pair_comparator)
    |> Enum.map(&boolean_to_integer/1)
    |> Enum.sum()
  end

  def ranges_overlap?({{r1_lower, r1_upper}, {r2_lower, r2_upper}}) do
    r1_lower >= r2_lower && r1_upper <= r2_upper ||
    r2_lower >= r1_lower && r2_upper <= r1_upper
  end

  def boolean_to_integer(bool) do
    if bool, do: 1, else: 0
  end

  def printResults() do
    readProblem()
    |> resolve(&ranges_overlap?/1)
    |> Integer.to_string()
    |> IO.puts()
  end

end
