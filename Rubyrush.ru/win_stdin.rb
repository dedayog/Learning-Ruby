# Обработка SNDIN для Виндоус
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
####
# Мои методы для работы с файлом
# Цепляем расширение
def add_new_extension(ext='data')
  File.dirname(caller_locations.first.absolute_path)+'/'+File.basename(caller_locations.first.path,".*")+'.'+ext.to_s
end

# Чситаем содержимое файла в массив, 1 элемент массива = 1 строка файла
def read_data(data_file)
  if File.file?(data_file)
    f=File.new(data_file,'r:UTF-8')
    data_array = f.readlines(chomp:true)
    f.close
    return data_array # Возвращаем прочитанное
  else
    return false # Возвращаем false если файл не найден
  end
end
