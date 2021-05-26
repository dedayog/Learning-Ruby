
tickets_table = {
  :ticket_id => 'РМ2010398 050298',
  :first_name => 'Венедикт',
  :last_name => 'Ерофеев',
  :departure_station => 'Москва Курская',
  :arrival_station => 'Петушки',
  :departure_time => '7:48',
  :arrival_time => '9:27',
  :document_type => 'passport',
  :document_id => '45 99 550127',
  :train_id => '882/7082',
}

# puts tickets_table.values.join(', ')

tickets_table.each_pair do |key, val|
  puts "#{key}: #{val}"
end
