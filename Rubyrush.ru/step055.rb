require_relative = __dir__+'win_stdin'
DATA = '/Lesson13/data/'

print 'Поиск файлов в папке ./Lesson13/data/..  '

facials = {foreheads: [], eyes: [], noses: [], mouths: []}
file_ext = '.parts'

facials.each_key do |key|
  unless File.file? (__dir__+DATA+key.to_s+file_ext)
    abort "..файл \'#{key.to_s+file_ext}\' не найден"
  else
    f = File.new(__dir__+DATA+key.to_s+file_ext)
    facials[key] = f.readlines.map(&:chomp)
    # p val
    f.close
    print "..файл \'#{key.to_s+file_ext}\' найден  "
  end
end

puts
puts
facials.each_value {|val| puts val.sample}
