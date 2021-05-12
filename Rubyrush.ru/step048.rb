class Bodibuilder
  def initialize(name,m1=rand(7),m2=rand(7),m3=rand(7))
    @name = name
    @m1 = m1
    @m2 = m2
    @m3 = m3
  end
  def look_out
    [@name, @m1, @m2, @m3]
  end
end

members = [
  Bodibuilder.new('Коля'),
  Bodibuilder.new('Толя'),
  Bodibuilder.new('Арнольд')
]

top_member = nil

members.each do |i|
  member = i.look_out
  top_member ||= member.dup
  top_member = member if member.select{|i| i.is_a?(Integer)}.sum > top_member.select{|i| i.is_a?(Integer)}.sum
end

members.each{|i| p i.look_out}
puts "Победитель: #{top_member}"
