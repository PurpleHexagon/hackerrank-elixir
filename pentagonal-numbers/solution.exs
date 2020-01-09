defmodule Solution do
    #Enter your code here. Read input from STDIN. Print output to STDOUT
    def main do
        _test_cases = IO.gets("")
        solve(next(IO.gets("")))
    end

    def solve(nil) do end 
    def solve(n) do 
        result = round((3 * :math.pow(n, 2) - n) / 2)

        IO.puts(result)
        solve(next(IO.gets("")))
    end 

    defp next(:eof) do end 
    defp next(number) do
        number |> String.trim |> String.to_integer
    end
end

Solution.main()

