# Find largest palindrome product of 3 digit numbers

require_relative 'largest_prime'

def palindrome?(string)
  return true if string.length <= 1

  return false unless string[0] == string[-1]

  palindrome?(string[1..-2])
end

def largest_palindrome(digits)
  max = ('9' * digits).to_i
  factor = max_below_two_hundred(factors(max))
  lower_limit = max - factor
  palindrome_found = false

  until palindrome_found
    current_palindromes = palindromes(max, max, lower_limit)
    palindrome_found = current_palindromes.empty? ? false : true
    max = lower_limit
    lower_limit -= factor
  end

  current_palindromes.max
end

def palindromes(left, right, lower_limit, palindrome_arr = [])
  return palindrome_arr.sort.uniq if left == lower_limit

  if right == lower_limit
    palindromes(left - 1, left - 1, lower_limit, palindrome_arr)
  else
    product = left * right
    palindrome_arr << product if palindrome?(product.to_s)
    palindromes(left, right - 1, lower_limit, palindrome_arr)
  end
end

def max_below_two_hundred(factors)
  factors.each_with_index do |factor, index|
    if factor > 200
      return factors[index - 1]
    elsif index == (factors.length - 1)
      return factors[-1]
    end
  end
end

p largest_palindrome(3)
