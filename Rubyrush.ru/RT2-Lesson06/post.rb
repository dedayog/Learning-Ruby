class Post
  def initialize
    @created_at = Time.now
    @text = nil
  end
  def read_from_console
    # todo
  end
  def to_strings
    # todo
  end
  def save
    f = File.new(file_path, 'w:UTF-8')
    for items in to_strings do
      file.puts(item)
    end
    f.close
  end
  def file_path
    __dir__ + '/' + @created_at.strftime("#{self.class.name}_Y%_m%_d%_H%_M%_S%.txt")
  end
end
