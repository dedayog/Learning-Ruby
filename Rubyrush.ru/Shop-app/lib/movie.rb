class Movie < Product
  def initialize(params)
    super
    @name = params[:name]
    @director = params[:director]
    @year = params[:year]
  end
  def to_s
    "From #{@director} the movie \'#{@name}\' filmed in #{@year}. " + super
  end
  def self.create(lines)
    self.new({
      name: lines[0],
      director: lines[1],
      year: lines[2].to_i,
      price: lines[3].to_i,
      stock_balance: lines[4].to_i
      })
  end
end
