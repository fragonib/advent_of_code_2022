defmodule AoC.Day61 do

  def readProblem do
    IO.stream(:stdio, :line)
    |> Stream.flat_map(&String.graphemes/1)
  end

  def resolve(letterStream, distinctCharCount) do
    {_, index} = letterStream
    |> Stream.chunk_every(distinctCharCount, 1)
    |> Stream.with_index(0)
    |> Stream.drop_while(&areRepetitions?/1)
    |> Stream.take(1)
    |> Enum.to_list()
    |> Kernel.hd()
    index + distinctCharCount
  end

  def areRepetitions?({chars, index}) do
    [ _ | rest ] = chars
    case rest do
      [] -> false
      _ -> isHeadRepeated(chars) || areRepetitions?({rest, index})
    end
  end

  def isHeadRepeated(chars) do
    [ elem | rest ] = chars
    Enum.reduce(rest, false, fn (x, acc) -> acc || (elem == x) end)
  end

  @spec printResults :: :ok
  def printResults() do
    readProblem()
    |> resolve(4)
    |> IO.puts()
  end

end
