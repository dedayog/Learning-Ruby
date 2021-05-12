class Interface

  def initialize(ary)
    @array_of_heroes = ary
    @current_hero = ''
    @user_select = ''
    @quit = false
  end

  def user_select
    print "Ваш выбор (макс. #{@array_of_heroes.size}) или имя героя > "
    @user_select = STDIN.gets.chomp
    @quit = true if (@user_select == 'q' || @user_select == 'Q')
    @user_select
  end

  def select_hero (hero) # Select by index
    if hero > 0 && hero <= @array_of_heroes.size
      @current_hero = @array_of_heroes[hero-1]
    else
      @current_hero = 'Unknown hero'
    end
  end

  def is_a_hero? (hero)
    if @array_of_heroes.map(&:downcase).include?(hero)
      return true
    else
      return false
    end
  end

  def get_antipod (hero)
    @array_of_heroes.each_index do |i|
      if @array_of_heroes[i].downcase == hero && i.even?
        return @array_of_heroes[i+1]
      elsif @array_of_heroes[i].downcase == hero && i.odd?
        return @array_of_heroes[i-1]
      end
    end
  end

  def quit
    @quit
  end
  def current_hero
    @current_hero
  end

end # class

# Обработка SNDIN для Виндоус
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
####

# Пары герой-антипод
pairs = [
  'Буратино', 'Карабас',
  'Бильбо', 'Саурон',
  'Шерлок','Мориарти',
  'Бэтмэн','Джокер',
  'Моцарт','Сальери',
  'Спартак','ЦСКА',
  'Чацкий','Молчалин',
  'Наполеон','Кутузов',
  'король','шут'
]

# Начало программы

quiz = Interface.new(pairs)

until quiz.quit do

  hero = quiz.user_select # Читаем ввод
  quiz.select_hero (hero.to_i) # Ищем в базе
  hero = quiz.current_hero unless quiz.current_hero == 'Unknown hero'

  if quiz.is_a_hero?(hero.downcase)
    print "\"#{hero}\" > "
    p quiz.get_antipod(hero.downcase)
  else
    p "#{quiz.current_hero} does not exist"
  end

end
