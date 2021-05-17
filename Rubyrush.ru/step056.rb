### ~~~ Quiz poll ~~~
### read two arrays from files, then zip them into one, which will be shuffled

require_relative 'win_stdin'
DATA = '.\Lesson13\data\\'

questions = 'questions.data'
answers = 'answers.data'

if File.file? (__dir__+DATA+questions)
  f = File.new(__dir__+DATA+questions, 'r:UTF-8')
  questions = f.readlines.map(&:chomp)
  f.close
else
  abort "File \'#{__dir__+DATA+questions}\' not found"
end

if File.file? (__dir__+DATA+answers)
  f = File.new(__dir__+DATA+answers, 'r:UTF-8')
  answers = f.readlines.map(&:chomp)
  f.close
else
  abort "File \'#{__dir__+DATA+answers}\' not found"
end

totally = questions.zip(answers).shuffle
errors = 0

totally.each do |i|
  print "#{i[0]+' '}"
  answer = gets.chomp
  unless answer == i[1]
    errors += 1
    puts "#{i[0]+' '+i[1]+' <<<'}"
  end
end

puts '_' * 40
puts "Всего ошибок: #{errors}"
