require_relative '..\win_stdin'

puts 'I\'m your diary'
puts 'You can keep all your thoughts inside me'

current_path = File.dirname(__FILE__)
p current_path
p __dir__

line = nil
all_lines = []
separator = '---------------'

# Get a new diary record
until line == 'end'
  line = gets.chomp
  all_lines << line
end

# Replace control strong with separator
all_lines[-1] = separator

# Form the file_name then open file to write into
time = Time.now

file_name = time.strftime('%Y-%m-%d')
time_str = time.strftime('%H:%M')

file = File.new(current_path + '/' + file_name + '.txt', 'a:UTF-8')

# Start recording into file with TimeStamp separator
file.print("\n\r" + time_str + "\n\r")

all_lines.each {|line| file.puts(line)}
file.close

puts "Record saved in file #{file_name}"
