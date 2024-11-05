# frozen_string_literal: true

def fibs(number)
  fib_sequence = []
  (0..number).each do |digit|
    fib_sequence << (digit <= 1 ? digit : fib_sequence[-1] + fib_sequence[-2])
  end

  fib_sequence
end

p fibs(8)
# [0, 1, 1, 2, 3, 5, 8, 13, 21]

p fibs(27)
# [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987,
# 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418]

def fibs_req(number, pairs = {}, arr = [])
  return [pairs[number]] if pairs.keys.include?(number)

  if number.zero?
    pairs[0] = 0
    return arr << 0
  end

  if number == 1
    pairs[1] = 1
    return arr << 1
  end

  x, y = number.odd? ? [1, 2] : [2, 1]

  pairs[number] = fibs_req(number - x, pairs, arr)[-1] +
                  fibs_req(number - y, pairs, arr)[-1]

  arr << pairs[number]
end

p fibs_req(8)
# [0, 1, 1, 2, 3, 5, 8, 13, 21]

p fibs_req(27)
# [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987,
# 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418]
