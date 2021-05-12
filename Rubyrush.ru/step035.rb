PI = 3.141592653589693
def round_square(number)
  PI * number * number
end
answer = -1
while answer < 0
  print 'Введите радиус круга: '
  answer = gets.to_f
  puts round_square(answer)
end
