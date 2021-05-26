require_relative '../win_stdin'

table = {
  'H' => 'Кавендиш',
  'He' => 'Локьер, Жансен, Рамзай',
  'Li' => 'Арфведсон',
  'Be' => 'Воклен',
  'B' => 'Дэви и Гей-Люссак',
  'C' => 'неизвестен',
  'N' => 'Резерфорд',
  'O' => 'Пристли и Шееле',
  'F' => 'Муассан',
  'Ne' => 'Рамзай и Траверс'
}

print "У нас #{table.keys.size} элементов: "
puts table.keys.join(', ')

print 'Введите интересующий вас элемент: '
elem = STDIN.gets.chomp
if table.has_key?(elem)
  puts "Первооткрыватель элемента #{elem} — #{table[elem]}"
else
  puts 'Ошибочный элемент'
end
