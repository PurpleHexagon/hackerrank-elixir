alias :math, as: Math

defmodule Solution do
    defp fac(0), do: 1
    defp fac(n) when n > 0 do
      n * fac(n - 1)
    end
  
    def main do       
   
       _ = IO.gets("") |> String.trim |> String.to_integer 
    
       get_input(IO.gets(""), [])
       |> Enum.reverse
       |> Enum.each(
           fn x ->
               Enum.reduce(
                   1..8,
                   0.00000,
                   fn n, accum ->
                       f = n + 1
                  
                       r = if n == 1 do 
                           1.00000 + x + Math.pow(x, f) / fac(f)
                       else 
                           Math.pow(x, f) / fac(f)
                       end
                                           
                       accum = accum + r
                       
                       accum
                   end
               )
               |> Float.round(4)
               |> IO.puts
           end
       )
    end
    
    defp get_input(:eof, list), do: list 
    
    defp get_input(number, list) do
        formatted_number = String.trim(number) |> String.to_float
        get_input(IO.gets(""), [formatted_number | list])
    end
end

Solution.main()
