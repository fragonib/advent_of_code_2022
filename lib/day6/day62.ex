defmodule AoC.Day62 do

  alias AoC.Day61

  def printResults() do
    Day61.readProblem()
    |> Day61.resolve(14)
    |> IO.puts()
  end

end
