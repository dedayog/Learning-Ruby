require_relative 'bridge'

puts 'Поехали'

sleep 1

puts 'Внезапно река!'

sleep 1

bridge = Bridge.new

sleep 1

unless bridge.is_opened?
  bridge.open
end

p bridge.is_opened?
