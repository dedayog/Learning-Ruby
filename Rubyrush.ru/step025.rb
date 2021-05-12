cars = [
  'Cadillac',
  'Rolls-Royce',
  'Bentley',
  'Aston Martin',
  'Lotus',
  'Ferrari',
  'Lamborgini',
  'Mazeratti',
  'Lexus',
  'Porcshe',
  'Mercedes',
  'Infinity'
]

print 'There are twelve auto brands presented here. Enter your choice: '
user_choice = gets.to_i
until user_choice < 0 || user_choice > 12
  print 'Enter your choice: '
  user_choice = gets.to_i
end
puts "You selected the #{cars[user_choice-1]}"
