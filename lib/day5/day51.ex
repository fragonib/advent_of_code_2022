defmodule AoC.Day51 do

  def readProblem do
    IO.stream(:stdio, :line)
    |> Stream.chunk_by(fn line -> String.starts_with?(line, "move") end)
    |> Enum.to_list()
    |> parseProblem()
  end

  def parseProblem([stack_lines | [movement_lines]]) do
    %{
      movements: parseMovements(movement_lines),
      stacks: parseStacks(stack_lines)
    }
  end

  def parseMovements(lines) do
    lines |> Enum.map(&parseMovement/1)
  end

  def parseMovement(line) do
    regex = ~r/move (?<quantity>\d+) from (?<from>\d+) to (?<to>\d+)/
    Regex.named_captures(regex, line)
    |> Map.new(fn {k, v} -> { k, String.to_integer(v) } end)
  end

  def parseStacks(lines) do
    lines
    |> Enum.drop(-2)
    |> Enum.map(&parseStack/1)
    |> transpose()
    |> Enum.map(&(Enum.filter(&1, fn x -> String.length(x) > 0 end)))
  end

  def parseStack(line) do
    regex = ~r/(\s(\d)\s|\s\s\s|\[(\w)\])/
    Regex.scan(regex, line, capture: :all_but_first)
    |> Enum.map(&List.last/1)
    |> Enum.map(&String.trim/1)
  end

  def transpose(rows) do
    rows
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
  end

  def resolve(problem) do
    problem
    |> Enum.sum()
  end

  @spec printResults :: :ok
  def printResults() do
    readProblem()
    |> IO.puts()
  end

end
