# http://rosalind.info/problems/deg/

defmodule Graph do
  def parse do
    {:ok, file} = File.read "rosalind_deg.txt"
    [graph_info|edges] =  String.strip(file) |> String.split("\n")
    {node_count, _edge_count} = graph_info
                                |> String.split(" ")
                                |> Enum.map(fn(c) -> String.to_integer c end)
                                |> List.to_tuple

    pairs = Enum.map edges, fn(edge) ->
      edge
        |> String.split(" ")
        |> Enum.map(fn(c) -> String.to_integer c end)
    end
    counts = 1..node_count |> Enum.reduce([], fn(_, acc) -> acc ++ [0] end)

    {pairs, counts}
  end

  def degrees({pairs, counts}) do
    pairs
      |> List.flatten
      |> Enum.reduce(counts, fn(i, acc) -> List.replace_at acc, i - 1, Enum.at(acc, i-1) + 1 end)
      |> Enum.join " "
  end
end

File.write "deg_output.txt", Graph.parse |> Graph.degrees
