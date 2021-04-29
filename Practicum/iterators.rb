# Wiki Schoolbook
# https://ru.wikibooks.org/wiki/Ruby/%D0%9F%D1%80%D0%B0%D0%BA%D1%82%D0%B8%D0%BA%D1%83%D0%BC/%D0%98%D1%82%D0%B5%D1%80%D0%B0%D1%82%D0%BE%D1%80%D1%8B

MY_ARRAY_SIZE = 20
MIN_VALUE_FOR_RAND = -20
MAX_VALUE_FOR_RAND = 20

def mary (sz=MY_ARRAY_SIZE, max=MAX_VALUE_FOR_RAND, min=MIN_VALUE_FOR_RAND)
  (1..sz).map {rand(min..max)}
  #Array.new(sz) {rand(min..max)}
end

def task_01 # 1.1 Дан целочисленный массив. Найти количество чётных элементов.
  m = mary (20)
  p m
  p "="*20
  p m.select {|i| i.even?}.size
  p m.count {|i| i.even?}
  p m.select{|i| i[0].zero?}.size # Узнать как это работает!!!
  p m.delete_if{|i| i.odd?}.size
  p m.keep_if {|i| i.even?}.size
  p "="*20
  p m.collect {|i| i.even?}.size
  p m.filter {|i| i.even?}.size
  p m.map(&:even?).size
  p m.flat_map(&:even?).length
  p m.group_by {|i| i%2}.fetch(0).size
  p "="*20
  p m.group_by {|i| i%2}.sort.flatten.drop(1).size
  p m.count {|i| i%2==0}
  p m.each {|i| i.even?}.size
  p m.each_entry.map(&:even?).size
  p m.find_all {|i| i.even?}.size
  p "="*20
  p m.partition {|i| i.even?}.fetch(0).size
  p m.reject {|i| i.odd?}.size

# Узнать почему в последних двух строках разный результат. -
# Результат стал одинаковым самостоятельно , узнать что с интерпретатором
  # p m.chunk    { |n| n.even?}.each { |even, ary|  p [even, ary]}
  # p mary.chunk { |n| n.even?}.each { |even, ary|  p [even, ary]}
 end
 task_01

#  почему эти две строки выдают разный результат
