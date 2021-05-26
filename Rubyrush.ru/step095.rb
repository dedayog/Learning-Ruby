tickets_table = [
  {
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
},{
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
},{
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
},

]

### Commented code works same as below
#
# puts tickets_table.values.join(', ')
#
# 0.upto tickets_table.size-1 do |el|
#   puts "Место №#{el+1}"
#   tickets_table[el].each_pair do |key, val|
#     puts "#{key}: #{val}"
#   end
# end

tickets_table.each_with_index do |ticket, el|
  puts "Место №#{el+1}"
  ticket.each_pair {|key, val| puts "#{key}: #{val}"}
end
