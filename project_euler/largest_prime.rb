LARGE_NUM = 600_851_475_143

def prime_factors(number, prime_arr = [], smallest = 2)
  return (prime_arr + [1]).sort if number == 1

  if (number % smallest).zero?
    prime_arr << smallest
    prime_factors(number / smallest, prime_arr, 2)
  else
    prime_factors(number, prime_arr, smallest + 1)
  end
end

def combination_numbers(digits_in_prime, combinations_arr = [])
  digits_in_prime -= 1
  return combinations_arr if digits_in_prime == 1

  combinations_arr << digits_in_prime
  combination_numbers(digits_in_prime, combinations_arr)
end

def factors(number)
  prime_factors = prime_factors(number)
  other_factors = []

  possible_combinations = combination_numbers(prime_factors.length)

  possible_combinations.each do |num|
    combinations = prime_factors.combination(num).to_a
    other_factors += combinations.map do |arr|
      arr.reduce do |product, digit|
        product * digit
      end
    end
  end

  (prime_factors + other_factors).sort.uniq
end

# p prime_factors(LARGE_NUM)[-1]
# 6857

# p factors(LARGE_NUM)
# [71, 839, 1471, 6857, 87625999, 408464633, 716151937, 8462696833,
# 59569, 104441, 486847, 1234169, 5753023, 10086647]
