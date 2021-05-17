require 'translit'
require_relative 'win_stdin'

print 'Введите фразу для транслитерации: '
puts Translit.convert (STDIN.gets.chomp)
