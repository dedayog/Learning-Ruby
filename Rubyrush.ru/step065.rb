file_name = __dir__ + '\\step065.hello'

time = Time.now
greetings = STDIN.gets.chomp.encode('UTF-8')
greetings ||= 'Hello world!'
greetings = 'Hello world!' if greetings == ''
puts_string = time.strftime('%Y-%m-%d %H:%M > ') + greetings

file = File.new(file_name,'a:UTF-8')
file.puts(puts_string)
file.close
