class Duck
  attr_accessor :steps
  def initialize
    @steps = 0
  end
  def quake
    puts "Quaake"
  end
  def walk
    self.steps += 1
  end
end

class Dog
  attr_accessor :s, :x, :y
  def initialize (args={})
    @s = 0
    @x = args[:x] || 0
    @y = args[:y] || 0
  end
  def right
    @x += 1
  end
  def left
#    @x -= 1
  end
  def up
#    @y += 1
  end
  def down
    @y -= 1
  end
  def walk
    self.s += 1
  end
  def quake
    puts "Wof wof"
  end
  def label
    '@'
  end
end

class Robot
  attr_accessor :x, :y
  def initialize(args={})
    @x = args[:x] || 0
    @y = args[:y] || 0
  end
  def right
    @x += 1
  end
  def left
    @x -= 1
  end
  def up
    @y += 1
  end
  def down
    @y -= 1
  end
  def label
    '*'
  end
end

class DuckCommander
  def command(who)
    who.quake
    who.walk
  end
end

=begin
dog = Dog.new
duck = Duck.new
puts "#{duck.steps}"
dc = DuckCommander.new
dc.command(dog)
dc.command(duck)
dc.command(dog)
dc.command(dog)
puts "#{dog.steps}"
=end

class Commander
  def move(who)
    m = [:right, :left, :down, :up].sample
    who.send(m)
  end
end

############
# Code below was pasted from the lesson's tutorial
############

# Создать объект командира,
# командир в этом варианте программы будет один.
commander = Commander.new
# Массив из 10 роботов и...
arr = Array.new(10) { Robot.new }
# ...и одной собаки. Т.к. собака реализует точно такой же интерфейс,
# все объекты в массиве "как будто" одного типа.



4.times {|_| arr.push(Dog.new(x: -12, y: 12))} # This string was modified by homework from p.200



# В бесконечном цикле (для остановки программы нажмите ^C)
loop do
# Хитрый способ очистить экран
puts "\e[H\e[2J"
# Рисуем воображаемую сетку. Сетка начинается от -12 до 12 по X,
# и от 12 до -12 по Y
(12).downto(-12) do |y|
(-12).upto(12) do |x|
# Проверяем, есть ли у нас в массиве кто-то с координатами x и y.
# Заменили "any?" на "find" и записали результат в переменную
somebody = arr.find { |somebody| somebody.x == x && somebody.y == y }
# Если кто-то найден, рисуем label. Иначе точку.
if somebody
# ВОТ ОН, ПОЛИМОРФИЗМ!
# Рисуем что-то, "*" или "@", но что это - мы не знаем!
print somebody.label
else
print '.'
end
end
# Просто переводим строку:
puts
end
# Проверка столкновения. Если есть два объекта с одинаковыми
# координатами и их "label" не равны, то значит робот поймал собаку.
game_over = arr.combination(2).any? do |a, b|
a.x == b.x && \
a.y == b.y && \
a.label != b.label
end
if game_over
puts 'Game over'
exit
end
# Каждого объекта двигаем в случайном направлении
arr.each do |somebody|
# Вызываем метод move, все то же самое, что и в предыдущем
# варианте. Командир не знает кому он отдает приказ.
commander.move(somebody)
end
# Задержка в полсекунды
sleep 0.5

# The code below was written for homework p. 200
win_status = arr.combination(4).any? do |a, b, c, d|
  (a.label == '@' && b.label == '@' && c.label == '@' && d.label == '@') && \
  (((a.x >= 12) || (a.y <= -12)) && ((b.x >= 12) || (b.y <= -12))) && \
  (((c.x >= 12) || (c.y <= -12)) && ((d.x >= 12) || (d.y <= -12)))
end
if win_status
  puts 'WIN!!!'
  exit
end
end
