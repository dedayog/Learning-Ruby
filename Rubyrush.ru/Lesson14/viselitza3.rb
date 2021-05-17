require_relative 'result_printer'
require_relative 'game'
require_relative 'word_reader'

DATA = __dir__ + '.\data\words.txt'
IMAGES = __dir__ + '.\images\\'

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

printer = ResultPrinter.new(IMAGES)
reader = WordReader.new

slovo = reader.read_from_file(DATA)
slovo ||= ARGV[0]

game = Game.new(slovo)

while game.status == 0
  printer.print_status(game)
  game.ask_letter
end

printer.print_status(game)
