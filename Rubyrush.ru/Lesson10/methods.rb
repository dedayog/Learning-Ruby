def get_letters
  unless ARGV[0]
    abort 'Вы не указали слово'
  end
  return ARGV[0].encode('UTF-8').downcase.split('')
end

def get_user_input
  letter = ''
  while letter == '' do
    letter = STDIN.gets.encode('UTF-8').downcase.chomp
  end
  return letter[0]
  end

def check_result (user_input, letters, right_letters, wrong_letters)
  # Task 43 begin
  user_input = 'е' if user_input = 'ё'
  user_input = 'и' if user_input = 'й'
  # ... ends
  if (right_letters.include?(user_input) || wrong_letters.include?(user_input))
    return 0
  end
  if letters.include?(user_input)
    right_letters << user_input
    if letters.uniq.size == right_letters.size
      return 1
    else
      return 0
    end
  else
    wrong_letters << user_input
    return -1
  end
end

def get_word_for_print(letters, right_letters)
  result = letters.dup
  letters.each_index {|i| result[i] = '__' unless right_letters.include?(letters[i])}
  return result.join(' | ')
end

def cls
  system "clear" or system "cls"
end

def print_status(letters, wrong_letters, right_letters, errors)
  cls
  puts get_word_for_print(letters, right_letters)
  # puts '*' * 40
  # p letters
  puts "With #{errors} errors"
  puts "#{wrong_letters}"
end
