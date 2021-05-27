class Book < Product
  def initialize(params)
    super
    @genre ||= 'bestseller'
  end
  def to_s
    "The #{@genre} \'#{@name}\' of incredible author #{@author}. " + super
  end
  def self.create(lines)
    self.new({
      name: lines[0],
      genre: lines[1],
      author: lines[2],
      price: lines[3].to_i,
      stock_balance: lines[4].to_i
      })
  end

end
