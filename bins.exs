# http://rosalind.info/problems/bins/

defmodule Binary do
  def search(set, item) do
      length = Enum.count set
      range = 0..length-1
      search set, item, range
  end

  def search(set, item, range) do
    first..last = range
    test_index = div(last - first, 2) + first
    test_item = Enum.at set, test_index 

    cond do
      first == last && test_item != item ->
        -1
      test_item == item ->
        test_index + 1
      test_item < item -> 
        search set, item, test_index+1..last
      test_item > item -> 
        search set, item, first..test_index
    end
  end
end

{:ok, file} = File.read "rosalind_bins.txt"

a = String.split(file, "\n") |> Enum.at(2) |> String.split(" ") |> Enum.map fn(s) -> String.to_integer s end
l = String.split(file, "\n") |> Enum.at(3) |> String.split(" ") |> Enum.map fn(s) -> String.to_integer s end

File.write "bins_output.txt", Enum.map_join(l, " ", &(Binary.search(a, &1)))

