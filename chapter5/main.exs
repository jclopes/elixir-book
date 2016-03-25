# Exercise: Functions-2
answer = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, n) -> n
end

# Exercise: Functions-3
fizbuzz = fn
  (n) -> answer.(rem(n, 3), rem(n, 5), n)
end

IO.puts(fizbuzz.(10))
IO.puts(fizbuzz.(11))
IO.puts(fizbuzz.(12))
IO.puts(fizbuzz.(13))
IO.puts(fizbuzz.(14))
IO.puts(fizbuzz.(15))
IO.puts(fizbuzz.(16))

# Exercise: Functions-4
prefix = fn p -> fn s -> p <> " " <> s end
end

mrs = prefix.("Mrs")
IO.puts(mrs.("Smith"))

IO.puts(prefix.("Elixir").("Rocks"))

# Exercise: Functions-5
Enum.map [1,2,3,4], &(&1 + 2)
Enum.each [1,2,3,4], &IO.inspect/1
