# task 59 encluded

require_relative 'win_stdin'

DATA = __dir__+'/movies_db'
movies_db = [] # will be filled from data file

unless File.file?(DATA)
  abort "Can\'t find the data file: #{DATA}"
else
  f = File.new(DATA, 'r:UTF-8')
  f.readlines(chomp:true).each do |line|
    movies_db << line.split(' --- ')
  end
  f.close
end

puts
puts "Фильм на вечер: "
selected_movie = movies_db.sample
movie_instance = selected_movie[0]+' - '+selected_movie[1]+'. Рейтинг '+(movies_db.index(selected_movie)+1).to_s+' из '+movies_db.size.to_s+''
puts '¨' * movie_instance.size
puts movie_instance
puts '-' * movie_instance.size
selected_movie[2] ||= "Описание отсутствует"
puts selected_movie[2]
puts
