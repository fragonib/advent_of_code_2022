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

  def printResults() do
    readProblem()
    |> resolve()
    |> Integer.to_string()
    |> IO.puts()
  end

  def split_rucksack(rucksacks) do
    len = String.length(rucksacks)
    {
      String.slice(rucksacks, 0..div(len, 2) - 1),
      String.slice(rucksacks, div(len, 2)..-1)
    }
  end

  def violator({compart1, compart2}) do
    marker_to_integer = fn marker -> log2(marker) + 1 end
    (type_set(compart1) &&& type_set(compart2))
      |> marker_to_integer.()
      |> integer_to_type()
  end

  @spec priority(binary) :: integer
  def priority(type) do
    type_to_integer(type)
  end

  def type_set(rucksuck) do
    integer_to_marker = fn int -> 1 <<< int - 1 end
    String.graphemes(rucksuck)
      |> Enum.map(&type_to_integer/1)
      |> List.foldl(0, fn (x, acc) -> integer_to_marker.(x) ||| acc end)
  end

  @spec type_to_integer(binary) :: integer
  def type_to_integer(type) do
    <<code::utf8>> = type
    case code do
      x when x in 97..122 -> x - 96
      x -> x - 38
    end
  end

  def integer_to_type(type_int) do
    char_code = case type_int do
      x when x in 1..26 -> x + 96
      x -> x + 38
    end
    <<char_code::utf8>>
  end

  def log2(power_of_two) do
    case power_of_two do
       1 -> 0
       x -> 1 + log2(x >>> 1)
    end
  end

end
