# Winnie the Pooh tries to sleep

honeypots = []

4999_999.times do |i|
  honeypots << "#{i} is another honey pot"
end

honeypots = nil

GC.start

gets
