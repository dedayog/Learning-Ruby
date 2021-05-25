# adsad
digit = -1
until digit == '0'
  digit = gets.chomp.to_i.to_s
  sum = 0
  digit = digit.split('').map(&:to_i)
  digit.each do |e|
    if (e * 2) > 9
      sum += 1 + (e * 2) % 10
    else
      sum += e
    end
  end
  digit = digit.join
  if sum != 0
    puts('Sum is correct') if (sum % 10).zero?
    puts("Sum is #{sum} of #{digit}")
  end
end

__END__
# Обработка SNDIN для Виндоус
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
####

# puts 'one TWO three foUR'.split.map(&:capitalize)*' '
user_input = gets.chomp
puts user_input.split.map(&:capitalize)*' '
# p Encoding.locale_charmap


__END__
CONST = ' out there'
class Inside_one
   CONST = proc {' in there'}
   def where_is_my_CONST
      ::CONST + ' inside one'
   end
end
class Inside_two
   CONST = ' inside two'
   def where_is_my_CONST
      CONST
   end
end
puts Inside_one.new.where_is_my_CONST
puts Inside_two.new.where_is_my_CONST
puts Object::CONST + Inside_two::CONST
puts Inside_two::CONST + CONST
puts Inside_one::CONST
puts Inside_one::CONST.call + Inside_two::CONST
