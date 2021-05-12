argument = ARGV[0]

# if Gem.win_platform?
#   argument = argument.encode(ARGV[0].encoding, 'cp1251').encode('UTF-8')
# end
# p argument

if argument.downcase == 'дурак'
  puts 'Сам дурак'
else
  puts 'Здравствуй дорогой!'
end
