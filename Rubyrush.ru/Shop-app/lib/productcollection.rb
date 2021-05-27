class ProductCollection
  @all_goodies = []
  @categories = {}
  attr_reader  :categories, :all_goodies
  attr_writer :data_dir
  def initialize(data_dir)
    @data_dir = data_dir
    @categories = run_data_fill_keys
    # @categories = fill_categories
    @all_goodies = update
  end
  def update

  end
  def test
    Dir.children(File.dirname(caller_locations.first.path))
  end

  def fill_categories
    result = {}
    schema_file = 'schema.tag'
    file_name = @data_dir + schema_file
    lines = read_data_file(file_name)
    lines.each do |i|
      i.split(', ')
end

    if lines && lines[0].to_sym == key
      fst = {lines.shift.to_sym => Hash[lines.map.each_with_index { |k2,i| [k2.to_sym,i] } ]}
      result.merge!(fst)
    end
    result
    # Dir.foreach(@data_dir) {|x| puts "#{x}"}
    # p Dir.each_child(@data_dir)
  end

  def read_data_file(file_name)
    unless File.file?(file_name)
      return nil
    else
      lines = File.readlines(file_name, encoding: 'UTF-8', chomp: true)
    end
  end

  def run_data_fill_keys
  schema_file = '00.txt'
  result = {}
    self.class::data_files_location.each_pair do |key, val|
      fn = __dir__ + val + schema_file
      lines = read_data_file(fn)
        if lines && lines[0].to_sym == key
          fst = {lines.shift.to_sym => Hash[lines.map.each_with_index { |k2,i| [k2.to_sym,i] } ]}
          result.merge!(fst)
          # Dir.foreach(File.realdirpath(fn)) do |file|
          #   file.include?
          # end
        end
    end
    result
  end
  # private_class_method
  def self.data_files_location
    {
    book: '/../data/books/',
    movie: '/../data/movies/',
    }
  end
end

# def self.foo
#   puts "__FILE__: #{__FILE__}"
#   puts "__method__: #{__method__}"
#   puts "caller: #{caller}"
#   puts "caller_locations.first.path: #{caller_locations.first.path}"
# end
