class String # Bad practics!!
  def is_palindrom?
    comma_str = ',.\\/\'\":\-\ '
    self::delete(comma_str) == self::delete(comma_str).reverse
  end
end # class

user_input = -1
until user_input == 0
  print 'Поиграем в палиндром: '
  user_input = gets.chomp
  puts user_input.is_palindrom? ? "#{user_input} — палиндром" : "#{user_input} — не палиндром"
end
