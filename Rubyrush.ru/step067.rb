data_file = __dir__ + '/' + File.basename(__FILE__,'.*')+'.holidays'

unless  File.file?(data_file)
  abort "Holidays data file #{data_file} not found"
end

# read data file and fill the array of holidays
file = File.new(data_file)
holidays_array = file.readlines(chomp:true)
file.close

year = (holidays_array[0].split)[1].to_i # Read the year from the second word of the service line of the datafile
puts "Year #{year}: loaded state holidays from datafile #{data_file}"
holidays_array.shift # Delete first service line
holidays_array.each_index {|line| holidays_array[line] = ([year.to_i, holidays_array[line].split('-').map(&:to_i)]).flatten}
puts '-' * 34
puts 'Введите 0 чтобы выйти из программы'
puts '-' * 34

### MAIN
exit_loop = Time.now
short_format = Time.now.strftime('%m-%d')
loop do
  print 'Введите дату %d-%m(-%Y): '
  user_input = gets.chomp
  abort 'Прервано пользователем' if user_input == '0'

  user_input = user_input.split('-').map(&:to_i)
  user_input[2] ||= year # Если год не введён исопльзуем год из файла
  t = Time.new(user_input[2],user_input[1],user_input[0])
  output_day = t.strftime('%d %b %Y')
  puts("#{output_day} выходной. Воскресенье") if t.sunday?
  puts("#{output_day} выходной. Суббота")  if t.saturday?
  puts("#{output_day} государственный праздник") if holidays_array.include?(user_input.reverse)
end
