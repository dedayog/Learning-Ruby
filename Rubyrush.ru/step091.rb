$a = 'a'
b = 2

def my_method
  c = 3
  p "$a is defined with #{$a}"  if defined?($a)
  p "b is defined with #{b}"  if defined?(b)
  p "c is defined with #{c}"  if defined?(c)
end

p "$a is defined with #{$a}"  if defined?($a)
p "b is defined with #{b}"  if defined?(b)
p "c is defined with #{c}"  if defined?(c)

my_method
