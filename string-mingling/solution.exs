defmodule Solution do
    def solve([], [], solution) do
        solution
    end

    def solve([p_head | p_tail ], [q_head | q_tail ], solution) do 
        solve(p_tail, q_tail, [solution] ++ [p_head] ++ [q_head])
    end

    def main do       
       p = IO.gets("") |> String.trim 
       q = IO.gets("") |> String.trim 

       p_list = String.graphemes(p)
       q_list = String.graphemes(q)
       
       solve(p_list, q_list, [])
       |> IO.puts
    end
end

Solution.main()


