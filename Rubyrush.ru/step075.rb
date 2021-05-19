# def get_number
#   number = 'q'
#   until number.to_i.to_s == number
#     print 'Введите целое число: '
#     number = gets.chomp
#   end
#   return number.to_i
# end

print 'Введите строку: '
math_str = gets.chomp
begin
  p eval(math_str)
rescue ZeroDivisionError
  puts 'Деление на 0 низзя'
end
