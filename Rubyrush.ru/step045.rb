class Hameleon
  def initialize
    @color = 'зелёный'
  end
  def change_color(c='зелёный')
    @color = c
    puts "Теперь я #{@color}"
  end
end

boogie = Hameleon.new

boogie.change_color('красный')
boogie.change_color
