class Movie
  attr_accessor :name, :director, :year
  def initialize(name,director,year)
    @name = name
    @director = director
    @year = year
  end
end # class

def get_director
  directors = ary.each.director.uniq
  p directors
end

def insert_record (name,director,year)
  new_movie = Movie.new(name,director,year)
  @ary << new_movie
end

def delete_record (index)
  @ary.delete_at(index)
end

@ary = []
loop_exit = -1
menu = -1

until loop_exit == 0
  puts '_' * 20
  @ary.each_index{|i| puts "#{i}\t#{@ary[i].name}\t#{@ary[i].director}\t#{@ary[i].year}"}
  puts '_' * 20
  print '1 - select movie, 2 - insert, 3 - delete: '
  menu = gets.chomp.to_i
  case menu
  when 0
    loop_exit = 0
  when 1
    selected = @ary.sample
    puts "#{selected.name} by #{selected.director}"
    gets
  when 2
    print 'movie name is: '
    insert_name = gets.chomp
    print 'director is (0 for selection from existing): '
    insert_director = gets.chomp
    print 'year of production: '
    insert_year = gets.chomp
    insert_record(insert_name,insert_director,insert_year)
  when 3
    delete_index = gets.chomp.to_i
    delete_record (delete_index)
  end
end
