class WordReader
  @data = []
  def read_from_file(filename)
    begin
    # return nil unless File.file?(filename)
      f = File.open(filename,'r:UTF-8')
      p 'f.class'
      @data = f.read.split.flat_map(&:chomp)
      f.close
      @data.sample
    rescue Errno::ENOENT
      @data = ARGV
      abort 'ERROR - Can\'t read words' if @data == []
    ensure
      print "Reading data file tryout with #{filename}"
    end
  end
end # class
