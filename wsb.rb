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
  m = Array.new(sz) {rand(min_val..max_val)}
  # (1..sz).map {rand(min_val..max_val)}
end

=begin
ary = Mary.new(20,20).idx
p ary
bry = mary(5,15)
p bry
=end
def taskX
  m = mary
  # Test
   # p m
end
taskX
#exit

# # 63. Дан целочисленный массив. Найти максимальное количество подряд идущих минимальных элементов.
# # 64. Дан целочисленный массив. Найти максимальное количество подряд идущих максимальных элементов.
def task63
  m = mary
  m = [2,1,3,2,1,1,1,1,2,3,2,1,2,1,2,5,6,5,6,5,6]
  sz = m.size
  m_min, m_max = m.min(2), m.max(2)
  # Ужасное решение, надо будет попробовать другое
  c, total = [], 0
  elem_count = 2
  c_vals = m.uniq.min(elem_count) # 63.
  c_vals = m.uniq.max(elem_count) # 64.
  c_incr = m.slice_when {|a,b| a>b}.map {|i| if i.size >= elem_count then i.uniq.flatten end}.compact.to_a
  c_decr = m.slice_when {|a,b| a<b}.map {|i| if i.size >= elem_count then i.uniq.flatten end}.compact.to_a
  total += c_incr.map! {|i| i if (i & c_vals).size == c_vals.size}.compact.size
  total += c_decr.map! {|i| i if (i & c_vals).size == c_vals.size}.compact.size
  # Tests
  p c_incr, c_decr, c_vals
  p m
  p total
end
task63
exit

# Захотелось мне игру с бинарным поиском
def guess_num
  hidden_num = rand(1..100)
  tryouts = 6
  print "Enter your first number: \y"
  while tryouts > 0
    tryouts -= 1
    input = gets.to_i
    if input > hidden_num
      print 'Hidden num is low: '
    elsif input < hidden_num
      print 'Hidden num is high: '
    else
      print 'Yes! ' + input.to_s + ' !!! You won mazafaka !!!'
      exit
    end
  end
  print '\tyou lose... looooser. I hidden ' + hidden_num.to_s
end
guess_num
exit

# 61. Дан целочисленный массив. Найти два наибольших элемента.
# 62. Дан целочисленный массив. Найти два наименьших элемента.
def task61
  m = mary(10,10,-10)
  # Test
  p m.uniq.max(2)
  p m.uniq.min(2)
  p m
end
task61
exit

# 58. Дан целочисленный массив. Найти количество элементов, между первым и последним минимальным.
# 59. Дан целочисленный массив. Найти количество элементов, между первым и последним максимальным.
def task59 # 59, 60
  m = mary(20,10,-10)
  # Test
  p (m.index(m.min)-m.rindex(m.min)).abs != 0 ? (m.index(m.min)-m.rindex(m.min)).abs-1 : 0
  p m.rindex(m.max)-m.index(m.max) !=0 ? m.rindex(m.max)-m.index(m.max)-1 : 0
  p m
end
task59
exit

# 57. Дан целочисленный массив. Найти индекс первого экстремального (то есть минимального или максимального) элемента.
# 58. Дан целочисленный массив. Найти индекс последнего экстремального (то есть минимального или максимального) элемента.
def task57 # 57, 58
  m = mary(10,5,-5)
  # Test
  x1 = m.index(m.min) < m.index(m.max) ? m.index(m.min) : m.index(m.max)
  x2 = m.rindex(m.min) > m.rindex(m.max) ? m.rindex(m.min) : m.rindex(m.max)
  puts "Index of first extremal value is #{x1}. Index of last etremal value is #{x2} in array:"
  p m
end
task57
exit

# 49. Дан целочисленный массив. Найти количество элементов, расположенных перед первым минимальным.
# 50. Дан целочисленный массив. Найти количество элементов, расположенных перед первым максимальным.
# 51. Дан целочисленный массив. Найти количество элементов, расположенных после первого максимального.
# 52. Дан целочисленный массив. Найти количество элементов, расположенных после первого минимального .
# 53. Дан целочисленный массив. Найти количество элементов, расположенных перед последним максимальным.
# 54. Дан целочисленный массив. Найти количество элементов, расположенных перед последним минимальным.
# 55. Дан целочисленный массив. Найти количество элементов, расположенных после последнего максимального.
# 56. Дан целочисленный массив. Найти количество элементов, расположенных после последнего минимального.
def task49 # 49, 50, 51, 52, 53, 54, 55, 56
  m = mary
  m = [4,5,6,7,8,1,2,1]
  # Решение - допустим индекс первого минимального как X, значит его порядковый номер X+1
  # Это означает что перед ним X элементов
  # Test
  p m.index(m.min)            # 49
  p m.index(m.max)            # 50
  p m.size-1-m.index(m.max)   # 51
  p m.size-1-m.index(m.min)   # 52
  p m.rindex(m.max)           # 53
  p m.rindex(m.min)           # 54
  p m.size-1-m.rindex(m.max)  # 55
  p m.size-1-m.rindex(m.min)  # 56
end
task49
exit

# 47. Дан целочисленный массив и интервал a..b. Найти минимальный из элементов в этом интервале.
# 48. Дан целочисленный массив и интервал a..b. Найти максимальный из элементов в этом интервале.
def task47 # 47, 48
  m = mary(10,5,-5)
  r_min = rand(0..rand(m.size-3)) # At least 3 elems must be represented
  r_max = rand(r_min+2..m.size-1)
  # Test
  p m[r_min..r_max].min
  p m[r_min..r_max].max
  puts "Array #{m}"
  puts "Subranges within indeces [#{r_min}..#{r_max}]"
end
task47
exit

# 45. Дан целочисленный массив. Найти минимальный положительный элемент.
# 46. Дан целочисленный массив. Найти максимальный отрицательный элемент.
def task45 # 45, 46
  m = mary(10,5,-5)
  # Test
  p m.select {|i| i>0}.min
  p m.select {|i| i<0}.max
  p m
end
task45
exit

# 41. Дан целочисленный массив. Найти минимальный четный элемент.
# 42. Дан целочисленный массив. Найти минимальный нечетный элемент.
# 43. Дан целочисленный массив. Найти максимальный четный элемент.
# 44. Дан целочисленный массив. Найти максимальный нечетный элемент.
def task41 # 41, 42, 43, 44
  m = mary(10,10,-10)
  # Test
  puts "41.:   #{m.select {|i| i.even?}.min}"
  c = (Array.new << m).flatten
  puts "42.:   #{c.keep_if {|i| i.odd?}.min}"
  c = (Array.new << m).flatten
  puts "43.:   #{c.delete_if {|i| i.odd?}.max}"
  c = (Array.new << m).flatten
  puts "44.:   #{c.inject(0) {|mm, i| i%2 == 1 && i > mm ? i : mm}}" # !!! Алярма! Такой метод вычисления будет выдавать ошибку в массиве минимальным значением которого является 0
  p m
end
task41
exit

# 39. Дан целочисленный массив. Найти количество минимальных элементов.
# 40. Дан целочисленный массив. Найти количество максимальных элементов.
def task39 # 39, 40
  m = [ 1,1,2,3,4,1,1,6,3,6,6,3]
  # Test
  p m.find_all {|i| i == m.min}.size
  p m.find_all {|i| i == m.max}.size
end
task39
exit

# 35. Дан целочисленный массив. Найти индекс первого минимального элемента.
# 36. Дан целочисленный массив. Найти индекс первого максимального элемента.
# 37. Дан целочисленный массив. Найти индекс последнего минимального элемента.
# 38. Дан целочисленный массив. Найти индекс последнего максимального элемента.
def task35 # 35, 36, 37, 38
  m = [ 1,1,2,3,4,1,1,6,3,6,6,3]
  # Tests
  p m.index(m.min)
  p m.rindex(m.min)
  p m.index(m.max)
  p m.rindex(m.max)
end
task35
exit

# 33. Дан целочисленный массив. Найти индекс минимального элемента.
# 34. Дан целочисленный массив. Найти индекс максимального элемента.
def task33 # 33, 34
  m = mary(10,20,-20)

  # p (0...m.size).sort_by{ |i| m[i] }.reverse
  # Test
  p m.index(m.min)
  p m.find_index(m.min(1).first)
  p m.index(m.max)
  p m.find_index(m.max(1).first)
  p m
end
task33
exit

# 31. Дан целочисленный массив. Вывести индексы массива в том порядке,
# в котором соответствующие им элементы образуют убывающую последовательность.
# 32. Дан целочисленный массив. Вывести индексы массива в том порядке,
# в котором соответствующие им элементы образуют возрастающую последовательность.
def task31 # 31, 32
  m = mary(20,20,-20)

  # p m.slice_when {|a,b| a < b}.map(&:to_a) # ????? не нашел как разобрать на индексы
  # Посмотрю в чем разница работы методов slice_when и chunk_while
  # выяснил что работают одинаково за исключением boolean части
  # то есть slice_when создает чанк когда bool будет равен true
  # наглядно демонстриружщий пример - массив содержащий непрерывно следующий набор
  # элементов: X, Y, Y, Z при  X < Y < Z и при elt_before > elt_after.
  # Где фрагмент формируется между двумя чанками и включает в себя все что
  # не может вернуть true
  # p m.slice_when {|b,a| b > a}.map(&:to_a)
  # p m.chunk_while{|b,a| b < a}.to_a

  # Tests
  # Единственное решение, к тому же записанное в три строки, такое себе г...
  sum = []
  (m.size-1).times {|i| (sum.push(i); sum.push(i+1)) if m[i] > m[i+1] }
  p sum.uniq

  sum = []
  (m.size-1).times {|i| (sum.push(i); sum.push(i+1)) if m[i] < m[i+1] }
  p sum.uniq

  p m
end
task31
exit

# 29. Дан целочисленный массив. Упорядочить его по возрастанию.
# 30. Дан целочисленный массив. Упорядочить его по убыванию.
def task29 # 29, 30
  m = mary
  p m.sort
  p m.sort.reverse
  p m
end
task29
exit

# Task 25 - 26 - 27 - 28
# Дан целочисленный массив. Преобразовать его, вставив перед каждым положительным элементом нулевой элемент.
# Дан целочисленный массив. Преобразовать его, вставив перед каждым отрицательным элементом нулевой элемент.
# Дан целочисленный массив. Преобразовать его, вставив после каждого положительного элемента нулевой элемент.
# Дан целочисленный массив. Преобразовать его, вставив после каждого отрицательного элемента нулевой элемент.
def task25 # 25, 26, 27, 28
  m = mary(20,20,-20)
  # Tests
  p m.flat_map {|i| i > 0  ? [0, i] : [i]}.compact # 25
  p m.filter_map {|i| i > 0 ? [0, i] : [i]}.flatten # 25
  p m.filter_map {|i| i > 0 ? [0, i] : [i]}.select{|i| i.size == 2} # 25 in pairs
  p m.flat_map {|i| i < 0  ? [0, i] : [i]}.compact # 26
  p m.flat_map {|i| i > 0  ? [i, 0] : [i]}.compact # 27
  p m.flat_map {|i| i < 0  ? [i, 0] : [i]}.compact # 28
  p '='*20
  p m
end
task25
exit

def task24 # 24
  m = mary(20.0,20.0,-20.0)
  r = rand(-20.0..20.0)
  p m.sort_by{|i| (i-r).abs}.last
  p m[m.map {|i| (i-r).abs}.index(m.map {|i| (i-r).abs}.max)]
  p m.fetch(m.map {|i| (i-r).abs}.index(m.map {|i| (i-r).abs}.max))
  p m.values_at(m.map {|i| (i-r).abs}.index(m.map {|i| (i-r).abs}.max)).first
  # Tests
  puts "Selected number #{r} with array: #{m}"

  dif = (m[0]-r).abs
  p m.keep_if {|i| dif = (i-r).abs if (i-r).abs >= dif }.last
end
task24
exit

def task23 # 23
  m = mary(20, 20.00, -20.00)
  r = rand(-20.00..20.00)
  # Tests
  p m.sort_by {|i| (i-r).abs}.first
  dif, val = (m[0]-r).abs, 0;
  (m.size).times { |i| (m[i]-r).abs < dif ? (val = m[i]; dif = (m[i]-r).abs) : val}
  p val
  dif = m.map{|elem| (r - elem).abs} #
  p m[dif.index(dif.min)]
  p r
  p m
end
task23
exit

# Task 21, 22
# В задачнике было:
# «Определить количество участков, на которых элементы массива монотонно возрастают.»
# Я для переопределил это задание для как:
# «За один проход выбрать все элементы массива являющиеся частями монотонных функций.
# Вывести результат с индексами начала и конца таких частей, а также общее количество
# частей отдельно для возрастающих и убывающих функций. При подсчете допускается
# пропустить все пары Xn = Xn+1 если они не являются частями явно выраженных монотонных функций»
# Решение задачи - не решил за 13  часов.... спустя 5 часов...
# Упоротый компост! Нашел метод slice_when который решает задачу в два хода
def task21
  puts "Define a parts of sequence"
  m = mary(25,15,-15)
  # m = [5,5,6,7,10,5,4,3,3]
#   seq_up, seq_down = [], []
#   grow_up, grow_down, grow_none = false, false, false
#   g_up_cnt, g_down_cnt = 0, 0
#   sz = m.size
#   1.upto sz-1 do |idx|
#     # Elements are equal
#     if m[idx] == m[idx+1] && !grow_none
#       if !grow_up
#         seq_up << idx
#         grow_up = true
#       end
#       if !grow_down
#         seq_down << idx
#         grow_down = true
#       end
#       grow_none = true
#     end
#     if m[idx] < m[idx+1]
#       if grow_up && grow_up == grow_none
#       end
#       if grow_none != 0 && grow_down == grow_none
#         seq_down.slice!(-1)
#         grow_down = 0
#       end
#       if grow_down !=0
#         seq_down << idx
#         g_down_cnt += 1
#       end
#     end
#     if m[idx] > m[idx+1]
#     end
#   end
# end
# Tests
  print "Array: #{m} \n"
  c = m.slice_when {|a,b| a >= b}.select {|ary| ary.size>1}
  puts "-- increasing sequence -- \n Total chunks: #{c.size},  with values:"
  p c
  c = m.slice_when {|a,b| a <= b}.select {|ary| ary.size>1}
  puts "-- decreasing sequence -- \n Total chunks: #{c.size},  with values:"
  p c
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
