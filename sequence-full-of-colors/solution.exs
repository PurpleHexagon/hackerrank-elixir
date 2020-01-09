defmodule Solution do
    def check_prefix(_list, _check_string, false), do: false
    def check_prefix([], _check_string, is_valid) do 
        is_valid
    end

    def check_prefix([head | tail], check_string, is_valid) do 
        check_string = cond do
            head == "R" ->   
                %{check_string | r: check_string.r + 1}
            head == "G" ->   
                %{check_string | g: check_string.g + 1}
            head == "B" ->   
                %{check_string | b: check_string.b + 1}
            head == "Y" ->   
                %{check_string | y: check_string.y + 1}
        end

        first = abs(check_string.r - check_string.g)
        second = abs(check_string.b - check_string.y)
        is_valid = if (second > 1  or first > 1) do false else true end
    
        check_prefix(tail, check_string, is_valid)
    end 

    def solve([]) do end

    def solve([x | cached_chars]) do 
        r = String.graphemes(x) |> Enum.count(& &1 == "R")
        g = String.graphemes(x) |> Enum.count(& &1 == "G")
        b = String.graphemes(x) |> Enum.count(& &1 == "B")
        y = String.graphemes(x) |> Enum.count(& &1 == "Y")
        
        if (r == g) and (b == y) do
            passes_prefix_check = check_prefix(String.graphemes(x), %{r: 0, g: 0, b: 0, y: 0}, true)

            res = if passes_prefix_check == true do 
                "True"
            else 
                "False"
            end
            IO.puts(res)
        else
            IO.puts("False")
        end

        solve(cached_chars)
    end

    def main do       
        _times = IO.gets("")
        get_input(IO.gets(""), [])
        |> Enum.reverse
        |> solve
    end

    defp get_input(:eof, list), do: list 
    defp get_input(number, list) do
        formatted = String.trim(number)
        get_input(IO.gets(""), [formatted | list])
    end
end

Solution.main()

