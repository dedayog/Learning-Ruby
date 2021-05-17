require_relative = __dir__+'win_stdin'
DATA = '/Lesson13/data/'

puts 'Поиск файлов в папке ./Lesson13/data/..'

if ARGV[0] == '' || ARGV[0] == nil
  print 'Введите имя файла: '
  fn = STDIN.gets.chomp.strip
elsif
  fn = ARGV[0]
end

unless File.file? (__dir__+DATA+fn)
  abort "..файл \'#{fn}\' не найден"
end

f = File.new(__dir__+DATA+fn, 'r:UTF-8')
lines = f.readlines
f.close

puts "Всего #{lines.size} строк. Вывожу последние 5 строк: "

5.times {|i| puts(lines[-(i+1)].split('#').map(&:strip)*' (c) ')}
