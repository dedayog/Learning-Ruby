class Memo < Post
  def read_from_console
    puts "Всё что написано до слова \"end\":"
    @text = []
    line = nil
    while line != 'end' do
      line = STDIN.gets.chomp
      @text << line
    end
    @text.pop
    return @text
  end
  def to_strings
    time_string = "Created at: #{@created_at.strftime('%Y-%m-%d %H:%M:%S')} /n/r /n/r"
        @text.unshift(time_string)
  end
end
