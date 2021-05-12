hidden_number = rand(15)
try_number = 3
until try_number == 0
  print 'Enter your attemption: '
  user_try = gets.to_i
  if user_try > hidden_number
    output = '<'
    output += '<' if (user_try - hidden_number).abs < 4
  elsif user_try < hidden_number
    output = '>'
    output += '>' if (user_try - hidden_number).abs < 4
  else
    puts "You won!"
    exit
  end
  puts output
  try_number -= 1
end
puts "You are loser! The number was #{hidden_number}"
