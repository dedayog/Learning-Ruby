class ResultPrinter

  def cls
    system "clear" or system "cls"
  end

  def print_viselitza(errors)
      case errors
      when 0
        puts "
        ______
        |/
        |
        |
        |
        |
        |
        |
        |
    ____|_______
    |          |
    "
    when 1
    puts "
        ______
        |/   |
        |   ( )
        |
        |
        |
        |
        |
        |
    ____|_______
    |          |
    "
  when 2
  puts "
        ______
        |/   |
        |   ( )
        |    |
        |   /|\\
        |
        |
        |
        |
    ____|_______
    |          |
    "
  when 3
  puts "
        ______
        |/   |
        |   ( )
        |    |
        |   /|\\
        |    | \\
        |
        |
        |
    ____|_______
    |          |
    "
  when 4
  puts "
        ______
        |/   |
        |   ( )
        |    |
        |   /|\\
        |  / | \\
        |    |
        |
        |
    ____|_______
    |          |
    "
  when 5
  puts "
        ______
        |/   |
        |   ( )
        |    |
        |   /|\\
        |  / | \\
        |    |
        |   / \\
        |
    ____|_______
    |          |
    "
  when 6
  puts "
        ______
        |/   |
        |   ( )
        |    |
        |   /|\\
        |  / | \\
        |    |
        |   / \\
        |      \\
    ____|_______
    |          |
    "
  when 7
  puts "
        ______
        |/   |
        |   (_)
        |    |
        |   /|\\
        |  / | \\
        |    |
        |   / \\
        |  /   \\
    ____|_______
    |          |
    "
end
end

  def print_status(game)
    cls
    print_viselitza(game.errors)
    puts "\nСлово: " + get_word_for_print(game.original_letters, game.letters, game.right_letters)
    puts "Ошибки (#{game.errors}): " + game.wrong_letters.join(', ')

    if game.status == -1
      puts "Вы проиграли :("
    elsif game.status == 1
      puts "Поздравляем! Вы выиграли !!!"
    else
      puts "Осталось попыток: #{7-game.errors}"
    end
  end

  def get_word_for_print(original_letters, letters, right_letters)
    result = letters.dup
    letters.each_index {|i| right_letters.include?(letters[i]) ? result[i] = original_letters[i] : result[i] = '_' }
    return result.join(' | ')
  end

end
