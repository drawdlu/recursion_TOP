require_relative './largest_prime'

def gcd(first_digit, second_digit)
  (factors(first_digit) & factors(second_digit)).max
end

def smallest_multiple(first_digit, second_digit = first_digit - 1)
  return 2 if second_digit == 1

  second_digit = smallest_multiple(second_digit, second_digit - 1)

  # LCM Formula
  (first_digit * second_digit) / gcd(first_digit, second_digit)
end

p smallest_multiple(20)
