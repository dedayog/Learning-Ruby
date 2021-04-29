MY_ARRAY_SIZE = 10
MIN_VALUE_FOR_RAND = -20
MAX_VALUE_FOR_RAND = 20

def mary (sz=MY_ARRAY_SIZE, max=MAX_VALUE_FOR_RAND, min=MIN_VALUE_FOR_RAND)
  (1..sz).map {rand(min..max)}
end

  m = mary (20)
p m
c = m.slice_when {|a,b| a <= b}.to_a
p c
c = m.slice_when {|a,b| a >= b}.select {|ary| ary.size>1}
p c, c.size
