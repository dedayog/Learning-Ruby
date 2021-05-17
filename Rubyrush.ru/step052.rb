class Man
  attr_accessor :gender, :age, :name
  @movie = ''

  def initialize (name, gender, age, movie)
    self.name=name
    self.gender=gender
    self.age = age
    self.movie=movie
  end

  def movie=(movie) # Favorite movie ofc
    @movie = movie
  end
  def movie # Favorite movie ofc
    @movie.capitalize
  end

  def gender=(gender)
    @gender = gender.downcase
  end

  def name=(name)
    @name = name.split.map(&:capitalize).*' '
  end

  def age=(age)
    @age = age.to_i
  end

end # class

peoples = [ # name, gender, age, movie
  'Сергей','муж','43','Челюсти',
  'марина','жен','22','красная шапочка',
  'Геннадий','муж','27','терминатор',
  'светлана','жен','65','санта-барбара',
  'инесса','ж','31','друзья',
]

@ary = []

def insert_record (name, gender, age, movie)
  a_man = Man.new(name, gender, age, movie)
  @ary << a_man
end

def delete_record(index)
  @ary.delete_at(index)
end

# Fills an array
peoples.each_index do |i|
  if i%4 == 0
    insert_record(peoples[i], peoples[i+1], peoples[i+2], peoples[i+3])
  end
end

# Обработка SNDIN для Виндоус
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
####

user_select = -1

until user_select == 0
  @ary.each_index {|i| puts "#{i}\t#{@ary[i].name}\t#{@ary[i].gender}\t#{@ary[i].age}\t#{@ary[i].movie}"}
  puts '_' * 60
  print '1 - Insert record, 2 - delete record: '; user_select = gets.chomp.to_i
  puts '_' * 60
  case user_select
  when 2
    index = gets.chomp.to_i
    delete_record (index)
  when 1
    print 'User name: '; name = gets.chomp
    print 'User gender: '; gender = gets.chomp
    print 'User age: '; age = gets.chomp
    print 'User\'s favorite movie: '; movie = gets.chomp
    insert_record(name, gender, age, movie)
  end
end
