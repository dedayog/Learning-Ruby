ary = [
  '',
  'Камень',
  'Ножницы',
  'Бумага'
]
loop do
  user_input = -1
  hidden = rand(1..3)
until user_input >= 0 && user_input <= 3
  print 'Введите 0 - выход, 1 - камень, 2 - ножницы, 3 - бумага: '
  user_input = gets.to_i
end
exit if user_input == 0
if user_input == hidden
  print "Ничия! Ваш выбор #{ary[user_input]}. Компьютер загадал #{ary[hidden]}\n"
elsif  hidden - user_input == 1 || user_input - hidden == 2
  print "Вы выиграли. Ваш выбор #{ary[user_input]}. Кампутир зогодал #{ary[hidden]}\n"
else
  print "Вы проиграли. Ваш выбор #{ary[user_input]}. Кампутир зогодал #{ary[hidden]}\n"
end
end
