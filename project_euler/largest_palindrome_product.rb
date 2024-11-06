# Find largest palindrome product of 3 digit numbers

def palindrome?(string)
  return true if string.length <= 1

  return false unless string[0] == string[-1]

  palindrome?(string[1..-2])
end
