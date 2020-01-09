defmodule Solution do
    def gcd(a, 0), do: a
    
    def gcd(a, b) when a > b do
        remainder = rem(a, b)
        gcd(b, remainder)
    end   

    def gcd(a, b) when a < b do
        remainder = rem(b, a)
        gcd(a, remainder)
    end   
    
    def main do       
       IO.gets("")
       |> fn numbers ->
           numbersList = String.split(numbers, " ")
                         |> Enum.map(
                           fn number -> 
                             String.trim(number) |> String.to_integer 
                           end
                         )
           apply(Solution, :gcd, numbersList)
       end.()
       |> IO.puts
    end
end

Solution.main()
