require_relative './largest_prime'

def gcd(first_digit, second_digit)
  (factors(first_digit) & factors(second_digit)).max
end

# p smallest_multiple(10)
