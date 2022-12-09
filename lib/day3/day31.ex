defmodule AoC.Day31 do
  import Bitwise

  def readProblem do
    IO.stream(:stdio, :line)
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
  end

  def resolve(problem) do
    problem
    |> Stream.map(&split_rucksack/1)
    |> Stream.map(&violator/1)
    |> Stream.map(&priority/1)
    |> Enum.sum()
  end

  def violator({compart1, compart2}) do
    type_set(compart1) &&& type_set(compart2)
  end

  def log2(x) do
    case x do
       1 -> 0
       _ -> 1 + log2(x >>> 1)
    end
  end

  def priority(type) do
    type_to_integer(type)
  end

  def printResults() do
    readProblem()
    |> resolve()
    |> Integer.to_string()
    |> IO.puts()
  end

  def type_to_integer(char) do
    <<code::utf8>> = char
    case code do
      x when x in 97..122 -> x - 96
      x -> x - 38
    end
  end

  @spec integer_to_type(integer) :: binary
  def integer_to_type(type_int) do
    code = case type_int do
      x when x in 1..26 -> x + 96
      x -> x + 38
    end
    <<code::utf8>>
  end

  def split_rucksack(rucksacks) do
    len = String.length(rucksacks)
    {
      String.slice(rucksacks, 0..div(len, 2) - 1),
      String.slice(rucksacks, div(len, 2)..-1)
    }
  end

  def type_set(rucksuck) do
    String.graphemes(rucksuck)
      |> List.foldl(0, fn (x, acc) -> 1 <<< type_to_integer(x) - 1 ||| acc end)
  end

end
