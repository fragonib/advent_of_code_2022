defmodule AoC.Day32 do

  import Bitwise
  alias AoC.Day31

  def readProblem do
    IO.stream(:stdio, :line)
    |> Stream.map(&String.trim/1)
    |> Stream.chunk_every(3, 3)
    |> Enum.to_list()
  end

  def resolve(problem) do
    problem
    |> Stream.map(&violator/1)
    |> Stream.map(&Day31.priority/1)
    |> Enum.sum()
  end

  def printResults() do
    readProblem()
    |> resolve()
    |> Integer.to_string()
    |> IO.puts()
  end

  def violator(group_rucksacks) do
    marker_to_integer = fn marker -> Day31.log2(marker) + 1 end
    group_rucksacks
      |> Enum.map(&Day31.type_set/1)
      |> List.foldr(-1, fn (x, acc) -> x &&& acc end)
      |> marker_to_integer.()
      |> Day31.integer_to_type()
  end

end
