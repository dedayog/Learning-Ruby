class Post
  def self.types_list
    [Task, Memo, Link]
  end
  def self.create(post_type)
    types_list[post_type].new
  end
  def initialize
    @created_at = Time.now
    @text = []
  end
  def read_from_console
    raise NoMethodError, 'Method must be realised in child'
  end
  def to_strings
    raise NoMethodError, 'Method must be realised in child'
  end
  def save
    f = File.new(file_path, 'w:UTF-8')
    to_strings.each {|str| f.puts(str)}
    f.close
  end
  def file_path
    __dir__ + '/' + @created_at.strftime("#{self.class.name}_%Y_%m_%d_%H_%M_%S.txt")
  end
end
