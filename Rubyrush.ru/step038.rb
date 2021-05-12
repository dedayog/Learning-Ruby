hidden_number = rand(16)

def get_direction (source, target)
  ret = ''
  ret = '<' if source - target < 4 && source > target
  ret = '>' if target - source < 4 && source < target
  ret += '>' if source < target
  ret += '<' if source > target
  return ret
end

answer =-1
tryouts = 3
until answer == 0 || tryouts < 1
  print 'Enter your number: '
  answer = gets.to_i
  if answer == hidden_number
    p "You won!"
    exit
  else
    p get_direction(answer, hidden_number)
    tryouts -= 1
  end
end
p "You lose. Hidden is #{hidden_number}"
