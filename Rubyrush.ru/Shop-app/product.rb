class Product

  attr_reader :price, :stock_balance, :name
  def initialize(params)
    params.each_pair do |key, val|
      instance_variable_set("@#{key}", val.to_s.chomp)
    end
  end
  def to_s
    "Cost #{@price}$. (in touch: #{@stock_balance})"
  end
  def update(params)
    params.each_pair do |key, val|
      instance_variable_set("@#{key}", val.to_s.chomp)
    end
  end



  private
  def self.data_files_location
    {
    book: '/data/books/',
    movie: '/data/movies/',
    }
  end

  def self.locate_data(locations)
    locations[:"#{self.name.downcase}"]
  end
end
