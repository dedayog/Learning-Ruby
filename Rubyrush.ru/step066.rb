require_relative 'win_stdin'

exit_loop = -1
until exit_loop == '0'
  time = Time.now
  time_str_to_file_name = time.strftime('%Y-%m-%d %H-%M')
  file_name = __dir__ + '/face ' + time_str_to_file_name
  if File.file?(file_name)
    puts ("File #{file_name} already exist. Wait to create a new one")
  else
    file = File.new(file_name,'w:UTF-8')
    file.puts ';-)'
    file.puts exit_loop.to_s
    file.close
  end
  print 'Create another one file or enter 0 for exit loop: '
  exit_loop = gets.chomp
end
