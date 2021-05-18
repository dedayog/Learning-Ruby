require_relative 'win_stdin'
data_file = add_new_extension('data') # from Win_Stdin
data_ary = read_data(data_file) # from Win_Stdin

abort 'Data file not found' unless data_ary

re = /\b[а-яА-Я\w]{3}\b/
total = 0

data_ary.each do |e|
  total += e.scan(re).size
end

p total
