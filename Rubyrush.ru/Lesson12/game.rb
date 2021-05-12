class Game

  def initialize(slovo)
    @original_letters = get_letters(slovo)
    @letters = formated_letters(@original_letters.dup)
    @errors = 0
    @wrong_letters = []
    @right_letters = []
    @status = 0
  end

  def get_letters(slovo)
    unless slovo
      abort 'Вы не указали слово'
    end
    slovo.downcase.split('')
  end

  def formated_letters(unformated)
    unformated.size.times do |i| # Formating to simple russian
      unformated[i] = 'е' if unformated[i] == 'ё'
      unformated[i] = 'и' if unformated[i] == 'й'
    end
    return unformated
  end

  # • Get input
  # • Check input
  def ask_letter
    print 'Введите букву: '
    letter = ''
    while letter == ''
      letter = STDIN.gets.chomp.downcase
    end
    next_step(letter)
  end

  def next_step(bukva)
    bukva = 'е' if bukva == 'ё'
    bukva = 'и' if bukva == 'й'
    if @right_letters.include?(bukva) || @wrong_letters.include?(bukva)
      return 0
    end

    if @letters.include?(bukva)
      @right_letters << bukva
      if @letters.uniq.size == @right_letters.size
        @status = 1
      end
    else
      @wrong_letters << bukva
      @errors += 1
      if @errors >= 7
        @status = -1
      end
    end
  end

  # Getters
  def letters
    @letters
  end
  def wrong_letters
    @wrong_letters
  end
  def right_letters
    @right_letters
  end
  def status
    @status
  end
  def errors
    @errors
  end
  def original_letters
    @original_letters
  end

end
