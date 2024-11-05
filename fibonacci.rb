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
