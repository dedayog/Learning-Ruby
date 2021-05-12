season = nil
temperature = nil
season = ARGV[0].downcase if ARGV[0]
temperature = ARGV[1].to_i if ARGV[1]
# until (season == 'winter' || season == 'autumn' || season == 'spring') && (temperature > 20 && temperature < 30) || (season == 'summer' && (temperature > 15 && temperature < 35))
until (season == 'winter' || season == 'autumn' || season == 'spring' || season == 'summer')
  print 'Enter season. Press 1 for Spring, 2 for sUmmer, 3 for Autumn, 4 for Winter: '
  season = STDIN.gets.downcase
  case season[0]
  when 's', 1
    season = 'spring'
  when 'u', 2
    season = 'summer'
  when 'a', 3
    season = 'autumn'
  when 'w', 4
    season = 'winter'
  else
    season = ['spring', 'summer', 'autumn', 'winter'].sample
  end
end

until (temperature)
  print 'Enter temperature C as integer: '
  temperature = STDIN.gets.to_i
  temperature = rand(15..35) if (temperature == 0)
end

if  ((season == 'winter' || season == 'autumn' || season == 'spring') && (temperature > 20 && temperature < 30)) || (season == 'summer' && (temperature > 15 && temperature < 35))
  puts 'The nightingale signs'
end

pp season, temperature
