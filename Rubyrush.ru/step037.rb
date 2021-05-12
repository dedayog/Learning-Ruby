def stars (n, sym)
  string = sym * n
end

print 'Введите последовательность символов: '
sym = gets.chomp
print 'Введите количество повторений: '
num = gets.to_i

p stars(num, sym)
