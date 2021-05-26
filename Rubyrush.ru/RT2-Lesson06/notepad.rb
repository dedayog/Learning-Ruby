require_relative '../win_stdin'
require_relative 'post'
require_relative 'link'
require_relative 'task'
require_relative 'memo'

puts 'Welcome to Notepadiano'

choices = Post.types_list

choice = -1

until choice >= 0 && choice < choices.size do
  print "Please select a number of post type #{choices}: "
  choice = STDIN.gets.chomp.to_i
  choice -= 1 if choice.is_a?(Integer)
end

entry = Post.create(choice)

entry.read_from_console

entry.save
