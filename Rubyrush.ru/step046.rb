class Man
  def initialize(first_name,middle_name)
    @first_name = first_name
    @middle_name = middle_name
  end
  def greetings
    puts "#{@first_name} #{@middle_name}"
  end
end

man1 = Man.new('Василий', 'Алибабаевич')
man2 = Man.new('Добрыня', 'Никитич')
man3 = Man.new('Васисуалий', 'Лоханкин')

man1.greetings
man2.greetings
man3.greetings
