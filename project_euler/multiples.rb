def multiples(number)
  return 3 if number == 3

  if (number % 3).zero? || (number % 5).zero?
    number + multiples(number - 1)
  else
    multiples(number - 1)
  end
end

puts multiples(9)
# 23

puts multiples(999)
# 233168
