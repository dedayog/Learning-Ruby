class ResultPrinter
  ERRORS = 7

  def initialize(images)
    @status_images = Array.new(ERRORS)
    (ERRORS+1).times do |i|
      image_file = images+i.to_s+'.txt'
      begin
        f = File.open(image_file,'r:UTF-8')
        @status_images[i] = f.read
        f.close
      rescue Errno::ENOENT
        puts "Error reading image file: #{image_file}"
        @status_images[i] = "\n[ Image ]\n[  not  ]\n[ found ]\n"
      end
    end
  end # init

  def cls
    system "clear" or system "cls"
  end

  def print_viselitza(errors)
    print @status_images[errors]
  end

  def print_status(game)
    cls
    print_viselitza(game.errors)
    puts "\nСлово: " + get_word_for_print(game.original_letters, game.letters, game.right_letters)
    puts "Ошибки (#{game.errors}): " + game.wrong_letters.join(', ')

    if game.status == -1
      puts "Вы проиграли :( #{game.original_letters.join.capitalize}"
    elsif game.status == 1
      puts "Поздравляем! Вы выиграли !!!"
    else
      puts "Осталось попыток: #{ERRORS-game.errors}"
    end
  end

  def get_word_for_print(original_letters, letters, right_letters)
    result = letters.dup
    letters.each_index {|i| right_letters.include?(letters[i]) ? result[i] = original_letters[i].upcase : result[i] = '_' }
    return result.join(' ⁞ ')
  end

end
