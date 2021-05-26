require_relative 'win_stdin'

class Parent98
  attr_reader :obedient, :name
def initialize
  print 'Введите имя персоны: '
  @name = STDIN.gets.chomp
    @obedient = true
end
end

class Child98 < Parent98
  def initialize
    super
    @obedient = false
  end
end

p1 = Parent98.new
c1 = Child98.new
c2 = Child98.new

puts "#{p1.name} послушный: #{p1.obedient}"
puts "#{c1.name} послушный: #{c1.obedient}"
puts "#{c2.name} послушный: #{c2.obedient}"
