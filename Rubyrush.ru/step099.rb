class Product
  attr_reader :price, :stock_balance, :name
  def initialize(price, stock_balance, name)
    @price = price
    @stock_balance = stock_balance
    @name = name
  end
end

class Book < Product
end

class Movie < Product
end

b= Book.new(290, 42, 'Yey')
p = Product.new(350,31, 'Tennis ball')
puts "#{b.name} only #{b.price}$     quantity[#{b.stock_balance}]"
puts "#{p.name} only #{p.price}$     quantity[#{p.stock_balance}]"
