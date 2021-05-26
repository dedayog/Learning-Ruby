require_relative '..\win_stdin'

print 'Введите героя: '
hero = STDIN.gets.chomp

heroes = {
"Бэтмэн" => "Джокер",
"Шерлок" => "Мориарти",
"Буратино" => "Карабас",
"Моцарт" => "Сальери",
"Фродо" => "Саурон",
}

if heroes.has_key?(hero)
  puts "Герой #{hero} — враг #{heroes[hero]}"
else
  puts "Врага для героя #{hero} найти не удалось"
end
