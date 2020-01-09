defmodule Solution do
#Enter your code here. Read input from STDIN. Print output to STDOUT

    def main do 
        _n = IO.gets("")

       get_input(IO.gets(""), [], 0)
       |> fn [head | tail] -> sum_it(tail, 0, head, head) end.()
       |> fn numerator -> (numerator / 2) end.()
       |> IO.puts
    end 

    defp sum_it([], accum, last_value, final) do 
        x1 = Enum.at(last_value, 0)
        y1 = Enum.at(last_value, 1)

        x2 = Enum.at(final, 0)
        y2 = Enum.at(final, 1) 

        accum = (x1 * y2 - y1 * x2) + accum

        accum
    end

    defp sum_it([head | tail], accum, last_value, final) do
        x1 = Enum.at(last_value, 0)
        y1 = Enum.at(last_value, 1)

        x2 = Enum.at(head, 0)
        y2 = Enum.at(head, 1) 

        accum = (x1 * y2 - y1 * x2) + accum

        sum_it(tail, accum, head, final)
    end

    defp get_input(:eof, list, _index), do: list 
    
    defp get_input(numbers, list, index) do
        index = index + 1

        formatted_numbers = String.split(numbers, " ")  
                            |> Enum.map( fn x ->
                                String.trim(x) |> String.to_integer
                            end)
        get_input(
            IO.gets(""), 
            list ++ [formatted_numbers],
            index
        )
    end
end

Solution.main()

