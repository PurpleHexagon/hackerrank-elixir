defmodule Solution do
  def permute(_list, accum, 0) do
    accum
  end

  def permute(list, accum, count) do
    new_list = List.insert_at(list, -1, Enum.at(list, 0)) |> Enum.slice(1 .. -1)

    permute(new_list, accum ++ [Enum.join(new_list)], (count - 1))
  end

  def main do
    _n = IO.gets("")

    get_input(IO.gets(""), [])
    |> Enum.map(
        fn x -> 
            list = String.graphemes(x) 
            permute(list, [], Enum.count(list)) 
        end
    )
    |> Enum.reverse
    |> print
  end

    def print([]) do end

    def print([head | tail]) do 
        IO.puts(Enum.join(head, " "))

        print(tail)
    end

    defp get_input(:eof, list), do: list 
    defp get_input(number, list) do
        formatted = String.trim(number)
        get_input(IO.gets(""), [formatted | list])
    end

end

Solution.main()


