# Wow, i learned how to use the Array.sample method! One of usage

# Code below create Array of Symbols
def robomoves
  ary_of_moves = [:right, :left, :up, :down] # defines method names for robots
  ary_of_moves.sample
end

# Create class Robot, with methods of moves
class Robot # Instance starts at pos [0, 0]
  attr_accessor :x, :y # The robot's position can be changed from the outside
  def initialize
    self.x, self.y = 0, 0
  end
  def right
    self.x += 1
  end
  def left
    self.x -= 1
  end
  def up
    self.y += 1
  end
  def down
    self.y -= 1
  end
  def report
    puts "im in pos #{@x}, #{@y}"
  end
end

=begin
r = Robot.new
r.send (robomoves)
r.report

def rand_move (robot) # Bring method to learning book, except method name
  robot.send (robomoves)
end

robots_ary = Array.new(10) {Robot.new}
=end

## - Page 191 -
## Below the copy-paste
##
## Thinking to write a game based on this lesson

class Commander
# Дать команду на движение робота. Метод принимает объект
# и посылает (send) ему случайную команду.
def move(who)
m = [:right, :left, :up, :down].sample
who.send(m)
end
end

commander = Commander.new

arr = Array.new(10) { Robot.new }

########
# MAIN Loop
########

loop do
  puts "\e[H\e[2J" # CLS



  # Рисуем воображаемую сетку. Сетка начинается от -30 до 30 по X,
  # и от 12 до -12 по Y
  (12).downto(-12) do |y|
  (-30).upto(30) do |x|
  # Проверяем, есть ли у нас в массиве робот с координатами x и y
  found = arr.any? { |robot| robot.x == x && robot.y == y }
  # Если найден, рисуем звездочку, иначе точку
  if found
  print '*'
  else
  print '.'
  end
  end
  # Просто переводим строку:
  puts
  end
  # Каждого робота двигаем в случайном направлении
  arr.each do |robot|
  commander.move(robot)
  end
  # Задержка в полсекунды
  sleep 0.5
end
