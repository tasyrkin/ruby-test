
def merge_arrays(a1, a2)

  a1 = a1.nil? ? [] : a1
  a2 = a2.nil? ? [] : a2

  new_array = []
  while !a1.empty? && !a2.empty?
    if a1[0] < a2[0]
      new_array << a1[0]
      a1.delete_at(0)
    else
      new_array << a2[0]
      a2.delete_at(0)
    end
  end

  if a1.empty?
    new_array = new_array + a2
  end
  if a2.empty?
    new_array = new_array + a1
  end

  new_array
end

puts merge_arrays([1,2,3], [4,5,6]).join(' ')

puts merge_arrays(nil, [4,5,6]).join(' ')

puts merge_arrays([1,2,3], nil).join(' ')