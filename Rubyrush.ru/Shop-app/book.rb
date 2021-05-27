class Book < Product
  def initialize(params)
    super
    @genre ||= 'bestseller'
  end
  def to_s
    "The #{@genre} \'#{@name}\' of incredible author #{@author}. " + super
  end
  def self.from_file
    f = File.new(file_name, 'r:UTF-8')
    @name = f.readline
    @genre = f.readline
    @author = f.readline
    @price = f.readline
    @stock_balance = f.readline
    f.close
    self.new({name: @name, genre: @genre, author: @author, price: @price, stock_balance: @stock_balance})
  end

  # private
  def self.file_name
    ####
    temp_file_name = '01.txt'
    ####
    __dir__ + locate_data(data_files_location) + temp_file_name
  end

end
