def sklonenie (number, krokodil, krokodila, krokodilov)
  if number%100 >= 11 && number%100 <= 14
    return krokodilov
  end
  case number%10
  when 1
    return krokodil
  when 2..4
    return krokodila
  when 5..9, 0
    return krokodilov
  end
end

answer = -1
until answer == 0
  print 'Введите число: '
  answer = gets.to_i
  p sklonenie(answer, 'поварёнок', 'поварёнка', 'поварят')
end
