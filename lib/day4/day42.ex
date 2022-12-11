defmodule AoC.Day42 do

  alias AoC.Day41

  def ranges_overlap?({{r1_lower, r1_upper}, {r2_lower, r2_upper}}) do
    r1_lower >= r2_lower && r1_upper <= r2_upper ||
    r2_lower >= r1_lower && r2_upper <= r1_upper
  end

  def printResults() do
    Day41.readProblem()
    |> Day41.resolve(&ranges_overlap?/1)
    |> Integer.to_string()
    |> IO.puts()
  end

end
