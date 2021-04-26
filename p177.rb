class Monkey
  attr_reader :state

  def initialize
    current_state = rand 1..3
    case current_state
    when 1
    @state = :running
    when 2
    @state = :jumping
    when 3
    @state = :stopped
    end
  end
  def got_a_look
    puts "This monkey is #{@state}"
  end
end

m = Monkey.new
m.got_a_look

m = Array.new (10) {Monkey.new}
m.each {|i| i.got_a_look}


__END__
class Car
  attr_accessor :state
  def initialize
    @state = :close
  end
  def open
    @state = :open
  end
end

car1 = Car.new
car1.open
puts "My state is #{car1.state }"
car1.state = :run
puts "My state is #{car1.state }"
car1.state = :broken
puts "My state is #{car1.state }"
