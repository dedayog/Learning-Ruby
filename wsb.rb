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

# Задачник отложен до лучших времен

# Task 21, 22
# В задачнике было:
# «Определить количество участков, на которых элементы массива монотонно возрастают.»
# Я для переопределил это задание для как:
# «За один проход выбрать все элементы массива являющиеся частями монотонных функций.
# Вывести результат с индексами начала и конца таких частей, а также общее количество
# частей отдельно для возрастающих и убывающих функций. При подсчете
# пропустить все пары Xn = Xn+1 если они не являются частями явно выраженных монотонных функций»
#  Решение задачи - не решил за 13  часов
def task21
  puts "Define a parts of sequence"
  m = mary(15,5,-5)
  m = [5,5,6,7,10,5,4,3,3]
  seq_up, seq_down = [], []
  grow_up, grow_down, grow_none = false, false, false
  g_up_cnt, g_down_cnt = 0, 0
  sz = m.size
  1.upto sz-1 do |idx|
    # Elements are equal
    if m[idx] == m[idx+1] && !grow_none
      if !grow_up
        seq_up << idx
        grow_up = true
      end
      if !grow_down
        seq_down << idx
        grow_down = true
      end
      grow_none = true
    end
    if m[idx] < m[idx+1]
      if grow_up && grow_up == grow_none
      end
      if grow_none != 0 && grow_down == grow_none
        seq_down.slice!(-1)
        grow_down = 0
      end
      if grow_down !=0
        seq_down << idx
        g_down_cnt += 1
      end
    end
    if m[idx] > m[idx+1]
    end
  end
end

# Tests
  print "Array: #{m} \n"
  p seq_up, seq_down
  print "-- increasing sequence -- \n Values: "
  seq_up.each_index {|i| print "from #{m[i-1]} to #{m[i]} in pos [#{i-1}], [#{i}]  |  " if i.even?}
  puts "Total #{g_up_cnt} pairs"
  print "-- decreasing sequence -- \n Values: "
  seq_down.each_index {|i| print "from #{m[i-1]} to #{m[i]} in pos [#{i-1}], [#{i}]  |  " if i.even?}
  puts "Total #{g_down_cnt} pairs"
end

task21
exit
# Task 18, 20
m = mary(10, 20, -20)
maximum_of_array = m.size
minimum, minimums_count = nil, 0
1.upto maximum_of_array-2 do |idx|
  if m[idx-1] > m[idx] && m[idx] < m[idx+1]
    current_minimum = m[idx]
    minimums_count += 1
    if minimum.nil?
      minimum = current_minimum
    elsif current_minimum < minimum
      minimum = current_minimum
    end
  end
end
# Tests
p m
p minimum, minimums_count

exit
# Task 17, 19
m = mary(10,10,-10)
cnt, max = 0, nil
mary.each_cons(3) do |a,b,c| # Still i dont know how to write it in a line ;-(
  if a<b&&b>c
     cnt+=1
     if max.nil? || b > max
       max = b
     end
   end
 end
p m, cnt, max

exit
# Task 16.. increase array range for frequent sequence searches
m = mary(100, 20, -20).map(&:to_f) # float for frequent
puts 'Parts of Geometric progression: ' # run several times for rusult !!!
m.each_index do |idx|
  if (idx > 0 && idx < m.size-1) && m[idx]/m[idx-1] == m[idx+1]/m[idx]
    puts "#{m[idx-1]} #{m[idx]} #{m[idx+1]} with a common ratio #{m[idx+1]/m[idx]}"
  end
end

exit
# Task 15
m = mary
puts 'Parts of Arithmetic progression: '
m.each_index do |idx|
  if (idx > 0 && idx < m.size-1) && m[idx]-m[idx-1] == m[idx+1]-m[idx]
    puts "#{m[idx-1]} #{m[idx]} #{m[idx+1]} with a common difference of #{m[idx+1]-m[idx]}"
  end
end

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
