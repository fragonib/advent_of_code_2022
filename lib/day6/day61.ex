defmodule AoC.Day61 do

  def readProblem do
    IO.stream(:stdio, :line)
    |> Stream.flat_map(&String.graphemes/1)
  end

  @spec resolve(any) :: number
  def resolve(letterStream) do
    [ {_, index} | _] = letterStream
    |> Stream.chunk_every(4, 1)
    |> Stream.with_index(0)
    |> Stream.drop_while(&areRepetitions?/1)
    |> Stream.take(1)
    |> Enum.to_list()
    index + 4
  end

  @spec areRepetitions?({nonempty_maybe_improper_list, any}) :: boolean
  def areRepetitions?({chars, _}) do
    [a, b, c, d | _] = chars
    a == b || a == c || a == d ||
    b == c || b == d ||
    c == d
  end

  @spec printResults :: :ok
  def printResults() do
    readProblem()
    |> resolve()
    |> IO.puts()
  end

end
