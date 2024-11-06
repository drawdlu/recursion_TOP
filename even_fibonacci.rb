LIMIT = 4 * (10**6)

def even_fib(prev = 2, cur = 8, sum = 10)
  next_digit = 4 * cur + prev

  return sum if next_digit >= LIMIT

  sum += next_digit

  even_fib(cur, next_digit, sum)
end

puts even_fib
