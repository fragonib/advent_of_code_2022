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
    |> evaluate_ranges_overlap()
    # |> Enum.map(&boolean_to_integer/1)
    # |> Enum.sum()
  end

  def evaluate_ranges_overlap(all) do
    case all do
      [] -> []
      [_] -> [false]
      [target | others] -> [has_overlapping(target, others)] ++ evaluate_ranges_overlap(others)
    end
  end

  def has_overlapping(range, other_ranges) do
    case other_ranges do
      [] -> false
      [other_range] -> ranges_overlap?(range, other_range)
      [other_range | others] -> ranges_overlap?(range, other_range) || has_overlapping(range, others)
    end
  end

  def ranges_overlap?({r1_lower, r1_upper}, {r2_lower, r2_upper}) do
    r1_lower >= r2_lower && r1_upper <= r2_upper ||
    r2_lower >= r1_lower && r2_upper <= r1_upper
  end

  def boolean_to_integer(bool) do
    if bool, do: 1, else: 0
  end

  def printResults() do
    readProblem()
    |> resolve()
    |> Integer.to_string()
    |> IO.puts()
  end

end
