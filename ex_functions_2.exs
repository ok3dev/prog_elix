fizz_buzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, n -> n
end

fizzy = fn n -> fizz_buzz.(rem(n, 3), rem(n, 5), n) end

IO.puts fizzy.(10)
IO.puts fizzy.(11)
IO.puts fizzy.(12)
IO.puts fizzy.(13)
IO.puts fizzy.(14)
IO.puts fizzy.(15)
IO.puts fizzy.(16)
