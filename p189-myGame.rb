# I think to transform robots into bio-robots, and so..
# i wrote a game «DINO-DEATH»

=begin

# Sry, i dont know how to use the dinamic constants
def we # World edges CONSTANTS
  LE = -30 # Left edge
  RE = 30  # Right edge
  TE = -10 # Top edge
  BE = 10  # Bottom Edge
end
=end

# Use simple constants for world sizes
# The iterations will be from left to right and top to bottom

  LE= -30
  RE=  30
  BE= -10
  TE=  10

class Bio # Dino can move, grow (and make little dinos in main loop)
  attr_accessor :x, :y
  attr_reader :age
  def initialize (x = rand(LE..RE), y = rand(BE..TE))
    @x, @y = x, y
    @age = 0
  end
  def move (x, y)
    @x += x
    @y += y
    return false if (@x < LE) || (@x > RE) || (@y > TE) || (@y < BE)
    @age += 1 # Dino grows at every turn
    true
  end
  def report
    # puts "im in pos #{@x}, #{y}" # Test!
    return @x, @y
  end
end

class God # God can moves dinos randomly
  def move(x = rand(-1..1), y = rand(-1..1))
    return x, y
  end
end

bio_ary = Array.new (50) {Bio.new}
g = God.new

cont = true
turn = 0
while cont do
  turn += 1
  puts "\e[H\e[2J"
  TE.downto BE do |y|
    LE.upto RE do |x|
      bio_ary.any? {|bio| bio.x == x && bio.y == y} ? (print "*") : (print ".")
    end
    puts
  end
  bio_ary.each do |b|
    x, y = b.report
    pair = bio_ary.find {|pair| pair.x == b.x && pair.y == (b.y - 1)}
    bio_ary.delete(pair) if pair
    pair = bio_ary.find {|pair| pair.x == b.x && pair.y == (b.y + 1)}
    bio_ary.delete(b) if pair

    ### Will code below works?
    pair = bio_ary.find {|pair| (pair.x == (b.x - 1)) && (pair.x == (b.x + 1)) && pair.y == b.y}
    bio_ary.delete(b) if pair
    ###

    pair = bio_ary.find {|pair| (pair.x == (b.x - 1)) && (pair.x - 1 > LE) && pair.y == b.y}
    if pair && pair.age > 10 && b.age > 10
      bio_ary.push(Bio.new(pair.x-1, pair.y ))
    end

    pair = bio_ary.find {|pair| (pair.x == (b.x + 1)) && (pair.x + 1 < RE) && pair.y == b.y}
    if pair && pair.age > 10 && b.age > 10
    bio_ary.push(Bio.new(pair.x+1, pair.y ))
    end
    #b.report # Test!
#    bio_ary.delete(b) if not g.move
    x, y = g.move
    bio_ary.delete(b) unless b.move(x, y)
  end
  break if bio_ary.size == 0
cont = (gets.chomp != '0')
end

puts "#{turn} turns"
