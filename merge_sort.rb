def merge_sort(arr)
  return arr if arr.length == 1

  mid = arr.length / 2
  merge(merge_sort(arr[0..(mid - 1)]), merge_sort(arr[mid..]))
end

def merge(left_arr, right_arr)
  aux_arr = []
  loop do
    if left_arr.empty?
      aux_arr.concat(right_arr)
      break
    elsif right_arr.empty?
      aux_arr.concat(left_arr)
      break
    end

    left_digit = left_arr.first
    right_digit = right_arr.first
    if left_digit < right_digit
      aux_arr << left_digit
      left_arr.delete(left_digit)
    else
      aux_arr << right_digit
      right_arr.delete(right_digit)
    end
  end

  aux_arr
end

p merge_sort([3, 2, 1, 13, 8, 5, 0, 1])
# [0, 1, 1, 2, 3, 5, 8, 13]

p merge_sort([105, 79, 100, 110])
# [79, 100, 105, 110]
