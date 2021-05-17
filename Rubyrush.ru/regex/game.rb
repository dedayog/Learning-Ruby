require_relative '../win_stdin'
require_relative 'methods'

regexp_str = get_random_regexp_string

puts "Придумайте как можно больше слов " \
  "содержащих #{regexp_str.gsub('.','*')}\n" \
  "Для выхода нажмите 0"
count = 0
words = []
#__END__

## MAIN
loop do
  print "#{regexp_str.gsub('.','*')} => Введите слово: "
  user_input = STDIN.gets.chomp
  break if user_input == '0'

  if user_input =~ /#{regexp_str}/
    if word_exist?(user_input)
      puts 'Есть такое слово'
      if words.include?(user_input)
        puts "#{user_input} уже в словаре"
      else
        count += 1
        words << user_input
      end
    else
      puts 'Нет такого слова'
    end
    else
      puts 'Неверный ввод'
  end
end

puts "Игра закончена, счёт: #{count}"
puts "#{words}"
