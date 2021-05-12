ary = []
print 'Длина массива: '
user_input = gets.to_i
until user_input > 0
  print 'Длина массива: '
  user_input = gets.to_i
end
# Built-in options
user_input.times {|i| ary.push(rand(100))}
p  ary.max, ary

# With loop
ary = []
i = 0
while i < user_input
  ary.push(rand(100))
  i += 1
end
max = 0
for item in ary do
  max = item if item > max
end
p max, ary
