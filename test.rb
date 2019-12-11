initial_array = ["9", "10", "J", "Q", "K", "cat", "dog", "monkey", "bird", "A"]
generated_matrix = []
position_array = [0,3,6,9,12,1,4,7,10,13,2,5,8,11,14]

15.times { |pos|
  key = initial_array[rand(initial_array.length)]
  hash = { key => pos s}
  generated_matrix.push(hash)
}

p generated_matrix

# p "analizando lineas"
# p first_line_array = generated_matrix[0..4]
# p second_line_array = generated_matrix[5..9]
# p third_line_array = generated_matrix[10..14]

# fourth_line = []
# new_array = [0,4,8,10,12]
# new_array.length.times { |x|
#  fourth_line.push(generated_matrix[position_array.index(new_array[x])])
# }
# p fourth_line

# fifth_line = []
# new_array = [2,4,6,10,14]
# new_array.length.times { |x|
#  fifth_line.push(generated_matrix[position_array.index(new_array[x])])
# }
# p fifth_line
