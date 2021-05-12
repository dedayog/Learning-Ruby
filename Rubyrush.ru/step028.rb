print 'Введите целое положительное число: '
user_input = gets.to_i
until user_input > 0
print 'Введите целое положительное число: '
user_input = gets.to_i
end
ary = (1..user_input).to_a
p ary.sum # With built-in method

# With loop
sum = 0
for item in ary do
  sum += item
end
p sum
