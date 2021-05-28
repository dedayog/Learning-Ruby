class ProductCollection
  attr_reader  :schema, :all_goodies
  attr_writer :data_dir
  def initialize(data_dir)
    @data_dir = data_dir
    @schema = update_schema
    update
  end

  def sort(sort_column, sort_direction_is_forward)
    unsorted_ary = @all_goodies.map(&:to_a).collect(&:flatten)
    sorted_ary = unsorted_ary.sort_by { |elem| elem[sort_column]}
    sort_direction_is_forward ? (return sorted_ary) : (return sorted_ary.reverse)
  end

  def update
    @all_goodies = []
    read_goodies
  end

  def update_schema
    result = {}
    schema_file = '/schema.tag'
    file_name = @data_dir + schema_file
    lines = read_data_file(file_name)
    abort 'Schema not present' unless lines
    lines.each do |i|
      cat_lines = i.split(', ')
      category = {cat_lines[0] => cat_lines.shift}
      category.merge!(cat_lines.shift.to_sym => Hash[cat_lines.map.each_with_index { |key, idx| [key.to_sym, idx]}])
      result.merge!(category)
    end
    result
  end

  private

  def read_data_file(file_name)
    unless File.file?(file_name)
      return nil
    else
      return File.readlines(file_name, encoding: 'UTF-8', chomp: true)
    end
  end

  def read_goodies
    Dir.each_child(@data_dir) do |d|
      dir_name = @data_dir + '/' + d
      if File.directory?(dir_name) && @schema.fetch(d, false)
        Dir.each_child(dir_name) { |f| add_to_collection(d, read_data_file(dir_name + '/' + f)) }
      end
    end
  end

  def add_to_collection(category, data_array)
    if category && data_array
      data_array[-2..-1] = data_array[-2..-1].map(&:to_i)
      @all_goodies << {category => data_array}
    end
  end

  def self.sort(sort_column, sort_direction_is_forward, all_goodies)
    unsorted_ary = all_goodies.map(&:to_a).collect(&:flatten)
    sorted_ary = unsorted_ary.sort_by { |elem| elem[sort_column]}
    sort_direction_is_forward ? (return sorted_ary) : (return sorted_ary.reverse)
  end

end

# def self.foo
#   puts "__FILE__: #{__FILE__}"
#   puts "__method__: #{__method__}"
#   puts "caller: #{caller}"
#   puts "caller_locations.first.path: #{caller_locations.first.path}"
# end
# def self.test
#   p Dir["#{@data_dir}/**/"]
#   Dir.each_child(@data_dir) do |d|
#     if File.directory?(@data_dir + '/' + d)
#       p Dir.children(@data_dir + '/' + d)
#     end
#   end
#   # p File.dirname(caller_locations.first.path)
# end
