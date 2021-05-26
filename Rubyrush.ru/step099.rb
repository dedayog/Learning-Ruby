class Product
  attr_reader :price, :stock_balance, :name
  def initialize(params)
    @price = params[:price]
    @stock_balance = params[:stock_balance]
  end
  def to_s
    "Cost #{@price}$. (in touch: #{@stock_balance})"
  end
  def update(params)
    params.each_pair do |key, val|
      instance_variable_set("@#{key}", val)
    end
  end
end

class Book < Product
  def initialize(params)
    super
    @name = params[:name]
    @author = params[:author]
    @genre = params[:genre]
    @genre ||= 'bestseller'
  end
  def to_s
    "The #{@genre} \'#{@name}\' of incredible author #{@author}. " + super
  end
end

class Movie < Product
  def initialize(params)
    super
    @name = params[:name]
    @director = params[:director]
    @year = params[:year]
  end
  def to_s
    "From the #{@director} a movie \'#{@name}\' filmed in #{@year}. " + super
  end
end

b1= Book.new({stock_balance: 290, price: 42, name: 'Yey'})
b2= Book.new({name: 'Lord of the Rings', genre: 'epic novel', author: 'John R. Tolkien', price: 99, stock_balance: 13})
m1= Movie.new({name: 'Terminator', year: 1983, director: 'James F. Cameron', price: 24, stock_balance: 241})

puts b1.to_s
puts b2.to_s
puts m1.to_s

m1.update({year:1984})
puts m1
