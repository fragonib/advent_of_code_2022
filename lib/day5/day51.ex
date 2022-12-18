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

  @spec resolve(%{:movements => any, :stacks => any, optional(any) => any}) :: any
  def resolve(problem) do
    %{movements: movements, stacks: stacks} = problem
    Enum.reduce(movements, stacks, &movement/2)
    |> Enum.map(&List.first/1)
    |> Enum.join("")
  end

  def movement(movement, stacks) do
    %{"quantity" => q, "from" => f, "to" => t} = movement
    source = Enum.at(stacks, f - 1) |> Enum.drop(q)
    crapes = Enum.at(stacks, f - 1) |> Enum.take(q) |> Enum.reverse()
    target = crapes ++ Enum.at(stacks, t - 1)
    List.replace_at(stacks, f - 1, source)
    |> List.replace_at(t - 1, target)
  end

  @spec printResults :: :ok
  def printResults() do
    readProblem()
    |> IO.puts()
  end

end
