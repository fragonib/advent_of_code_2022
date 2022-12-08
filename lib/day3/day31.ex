defmodule AoC.Day31 do
  import Bitwise

  def readProblem do
    IO.stream(:stdio, :line)
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
  end

  def resolve(problem) do
    problem
    |> Stream.map(&priority/1)
    |> Enum.sum()
  end

  def printResults() do
    readProblem()
    |> resolve()
    |> Integer.to_string()
    |> IO.puts()
  end

  # upcase? = fn x -> x == String.upcase(x)
  def upcase?(x) do
    x == String.upcase(x)
  end

  def priority(char) do
    <<v::utf8>> = char
    if upcase?(char) do
      v - 38
    else
      v - 96
    end
  end

  def split_rucksack(rucksacks) do
    len = String.length(rucksacks)
    {
      String.slice(rucksacks, 0..div(len, 2) - 1),
      String.slice(rucksacks, div(len, 2)..-1)
    }
  end

  def annotate(rucksuck) do
    String.graphemes(rucksuck)
      |> List.foldl(0, fn (x, acc) -> 1 <<< index(x) ||| acc end)
  end

  def index(char)  do
    priority(char) - 1
  end

end
