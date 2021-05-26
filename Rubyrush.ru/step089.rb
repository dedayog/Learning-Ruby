require_relative 'win_stdin'

print 'input variable value: '
var_val = STDIN.gets.chomp
if var_val.to_i.to_s == var_val
  p var_val.to_i.size
else
  puts "#{var_val.bytesize}"
end

number = 42
puts "В числе #{number} — #{number.size} байт"

string = 'Василий'
puts "В строке \"#{string}\" — #{string.bytesize} байт"
