# Wiki Shoolbook
# https://ru.wikibooks.org/wiki/Ruby/%D0%97%D0%B0%D0%B4%D0%B0%D1%87%D0%BD%D0%B8%D0%BA

# The code below is examples of creatiтп an array,
# i dont know how to do it right
class Mary
  attr_reader :idx
  def initialize(sz=1,max_val=50)
    @idx = []
    sz.times {@idx.push(rand(1..max_val))}
    #@idx
  end
end

MY_ARRAY_SIZE = 40
MIN_VALUE_FOR_RAND = -20
MAX_VALUE_FOR_RAND = 20

## Best usage for proc mary
def mary(sz=MY_ARRAY_SIZE, max_val=MAX_VALUE_FOR_RAND, min_val=0)
  (1..sz).map {rand(min_val..max_val)}
end

=begin
ary = Mary.new(20,20).idx
p ary
bry = mary(5,15)
p bry
=end



exit
# Task 13 - 14
m = mary
p m.rotate!(1)
p m.rotate!(-1)

exit
# Task 9 - 10 - 11 - 12
def task9 (vals=:min, elems=1)
  arr = mary(20, 10, -10)
  val = arr.send(vals)
  arr.each_index {|idx| arr[idx]=val if (elems > 0 && arr[idx] > 0) || (elems < 0 && arr[idx] < 0)}
end
p task9
p task9(:max)     # 10
p task9(:min, -1) # 11
p task9(:max, -1) # 12

__END__
# Task 5 - 6 - 7 - 8. I'll write procedure definition with args
def task5 (idx=0, rng=:even?, arr=mary) # idx can be -1, rng can be odd
  # test
  puts "=" * 80
  p arr
  sz = arr.length
  # здесь не совсем ясно задание, «...прибавив к четным числам первый элемент...»
  # если имелось ввиду к числам с четным индексом, тогда удаляем arr[] после if
  arr.each_index { |i| arr[i] += arr[idx] if arr[i].send(rng) && i != 0 && i != sz-1  }
end
p task5
p task5 (-1)       # task 6
p task5(-1, :odd?) # task 7
p task5(0, :odd?)  # task 8

__END__
# task 4
m = mary(40,20)
answer = m.index(m.select{|num| m[0] < num && num < m[-1]}.first) || []
puts "#{ m[0]} index=#{answer} value=#{m[answer]} #{m[-1]}"
answer = m.index(m.select{|num| m[0] < num && num < m[-1]}.last) || []
puts "#{ m[0]} index=#{answer} value=#{m[answer]} #{m[-1]}"

__END__
# task 3
# ЗДесь я неправильно понял условия задачи, на самом деле надо вывести индекс
# с числом меньшем последнего элемента массива и большим первого элемента массива
# m[0] < m[i] < m[-1]
m = mary(50,20)
1.upto m.size-2 do |i|
  if m[i-1] < m[i] && m[i] < m[i+1]
    break
    puts "#{ m[i-1]} #{m[i]} #{m[i+1]}"
  end
end

# Решение из задачника
answer = m.index(m.select{|num| m[0] < num && num < m[-1]}.first) || []
# или
answer = m.index {|idx| m[0] < idx && idx < m[-1]} || []
puts "#{ m[0]} #{answer} #{m[-1]}"

__END__
# https://stackoverflow.com/a/67281234/15707595
mary1 = %w{8 40 9}
mary2 = %w{9 8 40 9}
## Expected Output "9840" "99840"
#mary1 = %w{10 1 2}
m = mary1.sort.reverse.join
#m = mary1.map(&:to_i).sort.map(&:to_s).join

#m = mary1.sort{|a, b| b + a <=> a + b } # Not my RIGHT solution

__END__
# Spend few hours for solution
# https://stackoverflow.com/a/67280777/15707595
m = %w(a a a a a DDD DD ddd Ddd ddd e e e cC cC cC cC b x XXX XXX XXX ZZZ ZZZ ZZZ)
m = %w(n n n KKK KKK KKK KKK KKK LLL LLL LLL kk kk kk kk kk kk kk kk o OOOO OOOO ooo ooo)
m = m.inject(Hash.new(0)) {|h, n| h.update(n => h[n]+1)}
m = m.sort.sort_by {|k, val| -val}.to_h
p m

__END__
# task 2
ary = (1..50).to_a # Task's correct definition
p ary[0]
# puts "#{ary.find_all(&:odd?)}" # Wrong. The indeces must be odd
p ary.select.each_with_index{|_, i| i.odd?}

__END__
# task 1
ary = Array.new (50) {"Yap!"}
ary.each_index {|i| print "#{ary[i]} " if i.even? } # Displays the values referenced by an element
puts
ary.each_index {|i| print "#{i} " if i.odd?} # Displays the indeces that match conditions
# Google answer https://stackoverflow.com/questions/1614147/odd-or-even-entries-in-a-ruby-array
