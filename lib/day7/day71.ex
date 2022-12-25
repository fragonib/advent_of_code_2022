defmodule AoC.Day71 do

  alias AoC.Zipper
  alias AoC.Folder

  def readProblem do
    IO.stream(:stdio, :line)
    |> parseLine()
  end

  def parseLine("$ cd /", _) do
    Zipper.empty()
  end

  def parseLine("$ cd " <> name, zipper) do
    Zipper.cd(zipper, name)
  end

  def resolve(problem) do

  end

  @spec printResults :: :ok
  def printResults() do
    readProblem()
    |> resolve()
    |> IO.puts()
  end

end


defmodule AoC.Zipper do

  alias AoC.Zipper

  defstruct parent: nil,
            name: nil,
            files: [],
            children: []

  def empty() do
    %Zipper {
      name: String,
      files: [File]
      parent: Zipper,
      children: Zipper,
    }
  end

  z1 = {name: "fran", files: ["a", "b"], parent: nil, child: z2 }
  z2 = {name: "dani", files: nil, parent: z1, child: nil }

  1
   2
    3     {3, {2}}
     4
      5
       6

  {4, {5, {6}}}
  [1,2,_3_,4,5,6]

  {name, next}

  z3 = {3, [2,1], {4, {5, {6}}}}
  {z3, [2,1], {4, z3, z5}}
  {3, [2,1], [4,5,6]}
  {otro_name, [2,1], [4,5,6]}

  {"/", }

  # / {/, [b], [{c}], :nil}
  #  b
  #  c /   {c, [y, w], [{z}], {/}}
  #     y
  #     w
  #     z / {z, [a1, a2], [], {c}}
  #         a1
  #         a2
  def cd(zipper, name) do
    folder = Enum.find(zipper.children, fn f -> f.name == name end)
    parent = %{ zipper | children: List.delete(zipper.children, folder) }
    Folder.to_zipper(folder, parent)
  end

end

defmodule AoC.Folder do

  defstruct name: nil,
            size: 0,
            files: [],
            children: []

  def empty(name) do
    %AoC.Folder {
      name: name,
      size: 0,
      files: [File],
      children: [Folder]
    }
  end

  def to_zipper(folder, parent) do
    %AoC.Zipper {
      parent: parent,
      name: folder.name,
      files: folder.files,
      children: folder.children
    }
  end

end
