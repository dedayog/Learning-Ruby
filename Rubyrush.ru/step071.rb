require_relative 'win_stdin'

def is_email?(email)
  email =~ /^[\w\d\.]+@[\w\d\.]+.[\w]+$/ ? true : false
end

email = -1
until email == '0'
  email = STDIN.gets.chomp
  puts is_email?(email) ? "Электропочта!" : "Хрень какая-то"
end
