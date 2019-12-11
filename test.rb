initial_array = [9, 10, "J", "Q", "K", "cat", "dog", "monkey", "bird", "A"]
position_array = [0,3,6,9,12,1,4,7,10,13,2,5,8,11,14]
generated_matrix = []

15.times {
  generated_matrix.push(initial_array[rand(initial_array.length)])
}

p generated_matrix

p "creando lineas para analizar"
p first_line_array = generated_matrix[0..4]
p second_line_array = generated_matrix[5..9]
p third_line_array = generated_matrix[10..14]

fourth_line_array = []
new_array = [0,4,8,10,12]
new_array.length.times { |x|
 fourth_line_array.push(generated_matrix[position_array.index(new_array[x])])
}
p fourth_line_array

fifth_line_array = []
new_array = [2,4,6,10,14]
new_array.length.times { |x|
 fifth_line_array.push(generated_matrix[position_array.index(new_array[x])])
}
p fifth_line_array

gigant_array = [first_line_array, second_line_array, third_line_array, fourth_line_array, fifth_line_array]
p "revisando ganadores"
paylines = []

hash = {}
gigant_array.each { |array|
  result = array.select{ |e| array.count(e) > 2 }
  p result.size
  if result.size > 2
    key = array
    hash[key] = result.size
  end
}

p hash
