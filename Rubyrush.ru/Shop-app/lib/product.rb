class Product

  attr_reader :price, :stock_balance, :name

  def initialize(params);  update(params); end

  def to_s;  "Cost #{@price}$. (in touch: #{@stock_balance})" ;  end

  def update(params)
    params.each_pair do |key, val|
      instance_variable_set("@#{key}", val.to_s.chomp)
    end
  end

  def self.from_file(**args)
    if self.name == 'Product'
      raise NotImplementedError, 'Не стану читать абстрактный тип продукта'
    else
      args[:fn] ||= file_name + '01.txt'
      File.readlines(args[:fn], encoding: 'UTF-8').map { |l| l.chomp }
    end
  end
  private_class_method def self.file_name
    __dir__ + locate_data(data_files_location)
  end
  private_class_method def self.data_files_location
    {
    book: '/../data/books/',
    movie: '/../data/movies/',
    }
  end
  private_class_method def self.locate_data(locations)
    locations[:"#{self.name.downcase}"]
  end

end
