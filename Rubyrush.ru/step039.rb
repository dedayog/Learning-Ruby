def sklonenie (number, negritenok, negritenka, negrityat)
  n = number.to_s
  if n.size > 1
    m = (n[-2]+n[-1])
    if m == '11' || m == '12' || m == '13' || m == '14'
      return negrityat
    end
  end
  n = n[-1]
  case n
  when '1'
    return negritenok
  when '2', '3', '4'
    return negritenka
  when '5', '6', '7', '8', '9', '0'
    return negrityat
  end
end

answer = -1
until answer == 0
  print 'Введите негритят: '
  answer = gets.to_i
  p sklonenie(answer, 'негритёнок', 'негритёнка', 'негритят')
end
