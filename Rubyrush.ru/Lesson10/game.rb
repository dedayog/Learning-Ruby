if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'methods'
cls

puts 'The game VISELITZA v.0.2'
letters = get_letters # todo
errors = 0

wrong_letters, right_letters = [], []

while errors < 7 do
  print_status(letters, wrong_letters, right_letters, errors)
  print 'Введите следущую букву: '
  user_input = get_user_input
  result = check_result(user_input, letters, right_letters, wrong_letters)
  if (result == -1)
    errors += 1
  elsif (result == 1)
    break
  end
end

print_status(letters, wrong_letters, right_letters, errors)
