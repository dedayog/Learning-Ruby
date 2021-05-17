class WordReader
  @data = []
  def read_from_file(filename)
    return nil unless File.file?(filename)
    f = File.new(filename,'r:UTF-8')
    @data = f.read.split.flat_map(&:chomp)
    f.close
    @data.sample
  end
end # class
