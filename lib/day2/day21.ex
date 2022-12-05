defmodule AoC.Day21 do

  @spec mano(String) :: :paper | :rock | :scissors
  def mano(code) do
    case code do
      "A" -> :rock
      "B" -> :paper
      "C" -> :scissors
      "X" -> :rock
      "Y" -> :paper
      "Z" -> :scissors
      _ -> :none
    end
  end

  def parsePlay(n) do
    String.split(n)
    |> Enum.map(&mano/1)
  end

  def readProblem do
    IO.stream(:stdio, :line)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&(parsePlay/1))
    |> Enum.to_list()
  end

  @spec winner(nonempty_maybe_improper_list) :: boolean
  def winner([player1 | [player2]]) do
    case player1 do
       :rock -> player2 == :paper
       :paper -> player2 == :scissors
       :scissors -> player2 == :rock
    end
  end

  def outcome([player1 | [player2]]) when player1 == player2, do: 3
  def outcome(play) do
    case winner(play) do
      false -> 0
      true -> 6
    end
  end

  def shape([_ | [player2]]) do
    case player2 do
       :rock -> 1
       :paper -> 2
       :scissors -> 3
    end
  end

  def resolve(problem) do
    problem
    |> Stream.map(fn (x) -> outcome(x) + shape(x) end)
    |> Enum.sum()
  end

  def printResults() do
    readProblem()
    |> resolve()
    |> Integer.to_string()
    |> IO.puts()
  end

end
