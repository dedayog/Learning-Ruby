class Man
  def initialize(first_name, middle_name, age)
    @first_name = first_name
    @middle_name = middle_name
    @age = age
  end
  def greetings
    puts @age > 59 ? "#{@first_name} #{@middle_name}" : "#{@first_name}"
  end
end

man1 = Man.new('Василий', 'Алибабаевич', 35)
man2 = Man.new('Добрыня', 'Никитич', 60)
man3 = Man.new('Васисуалий', 'Лоханкин', 27)

man1.greetings
man2.greetings
man3.greetings
