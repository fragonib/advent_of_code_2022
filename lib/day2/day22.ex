defmodule AoC.Day22 do

  @spec mano(String) :: :paper | :rock | :scissors
  def mano(code) do
    case code do
      "A" -> :rock
      "B" -> :paper
      "C" -> :scissors
      "X" -> :lose
      "Y" -> :draw
      "Z" -> :win
      _ -> :none
    end
  end

  def parsePlay(n) do
    String.split(n)
    |> Enum.map(&mano/1)
    |> List.to_tuple()
  end

  def readProblem do
    IO.stream(:stdio, :line)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&(parsePlay/1))
    |> Enum.to_list()
  end

  def outcome({_, o}) do
    case o do
      :lose -> 0
      :draw -> 3
      :win -> 6
    end
  end

  def shape({player1, outcome}) do
    case player1 do
      :rock -> case outcome do
          :lose -> :scissors
          :draw -> :rock
          :win -> :paper
        end
      :paper -> case outcome do
          :lose -> :rock
          :draw -> :paper
          :win -> :scissors
        end
      :scissors -> case outcome do
          :lose -> :paper
          :draw -> :scissors
          :win -> :rock
        end
    end
  end

  def shape_score(play) do
    case shape(play) do
      :rock -> 1
      :paper -> 2
      :scissors -> 3
    end
  end

  def resolve(problem) do
    problem
    |> Stream.map(fn (x) -> outcome(x) + shape_score(x) end)
    |> Enum.sum()
  end

  def printResults() do
    readProblem()
    |> resolve()
    |> Integer.to_string()
    |> IO.puts()
  end

end
