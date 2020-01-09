defmodule Solution do
    def main do 
        sample = IO.gets("") |> String.graphemes 
        
        solve(sample, [])
        |> IO.puts
    end

    def solve([], solution) do 
        Enum.reverse(solution) |> Enum.join("")
    end

    def solve([head | tail], solution) do 
        if Enum.member?(solution, head) do 
            solve(tail, solution)
        else 
            solve(tail, [head] ++ solution)
        end
    end
end

Solution.main()

