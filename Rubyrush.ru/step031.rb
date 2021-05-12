ary = Array.new(rand(10..100)) {rand(100)}
p ary

sz = ary.size
middle = ary.size.even? ? ary.size/2 : ary.size/2+1
p ary.size, middle

1.upto(middle) do |i|
  ary[i-1], ary[sz-i] = ary[sz-i], ary[i-1]
end

p ary
