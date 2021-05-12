require 'date'
p Date.today.wday < 1 || Date.today.wday > 5 ? 'Сегодня выходной!' : 'Сегодня будний день, за работу чилавеки!'
coin = rand.round(2)
case coin
  when 0..0.09
    p "Монета встала на ребро!"
when 0.1..0.44
    p 'Выпал орёл'
  when 0.45..1
    p 'Выпала решка'
  end
__END__
CAR_PASSENGERS = 5
DIMENSION = 16

@guests = [{gender: 'male', name: 'Борис', id: 00000001 }]
@guests_ids = []
@guests.push(@guests[0])
@guest_stack

@gender = [
  :male ,
  :female
]

@names = [male: {
  'Анатолий',
  'Борис',
  'Игнатий',
  'Геннадий',
  'Николай',
  'Порфирий'
}, female: {
  'Татьяна',
  'Дарья',
  'Елена',
  'Светлана',
  'Ольга',
  'Просковья'
}]

greetings = {
  'хай': 010,
  'дарова': 100,
  'привет': 001,
  'шалом': 100,
  'чмоки': 010
}
recipients = {
  male: [
    'поцики',
    'парни',
    'пацаны',
    'мужики',
    'ребзя',
    'ребята'
],
  female: [
    'красатули',
    'девчата',
    'девченки',
    'красавицы'
  ]
}

def get_name (gender)
  gender == 'male' ? names[0].sample : names[1].sample
end

def get_id
  rand(DIMENSION).to_s(DIMENSION)+rand(DIMENSION).to_s(DIMENSION)+rand(DIMENSION).to_s(DIMENSION)+rand(DIMENSION).to_s(DIMENSION)+rand(DIMENSION).to_s(DIMENSION)+rand(DIMENSION).to_s(DIMENSION)+rand(DIMENSION).to_s(DIMENSION)+rand(DIMENSION).to_s(DIMENSION)
end

def guests_incoming(viz=rand(1..CAR_PASSENGERS))
  new_guests = []
  viz.times do |_|
    new_id = get_id
    while  @guests_ids.include?(new_id)
      new_id = get_id
    end
    new_gender = @gender.sample
    new_name = @names[new_gender].sample
    new_guest = [{id: new_id, gender: new_gender, name: new_name}]
    @guests_ids.push(new_id)
    new_guests.push(new_guest)
  end
end

def guests_leaving
  p 'test'
end

until gets.chomp.downcase == 'q'
  i = rand
  if i < 50
    guests_incoming
    say_goodbye
  else
    guests_leaving
    say_greetings
  end

end
