currency = 0
until currency == 1 || currency == 2
  print 'Select your currency (1 for rubles, 2 for dollars): '
  currency = gets.to_i
end
cur_text, ex_cur_text = 'rubles', 'dollars'
if currency == 2
  cur_text = 'dollars'
  ex_cur_text = 'rubles'
end
print "Enter quantity of your #{cur_text}: "
quantity = gets.to_f
print "Enter the rate of one of your #{cur_text}: "
rate = gets.to_f
puts "You have a #{quantity*rate} #{ex_cur_text}"
