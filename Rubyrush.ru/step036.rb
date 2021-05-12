def mary (size: 50, min_limit: 0, max_limit: 100, **)
  Array.new(size) {rand(min_limit..max_limit)}
end

def cutting_ary (n_first, source_ary)
  unless source_ary.is_a?(Array) || source_ary.size > 0 || n_first > 0
    return ['Wrong arguments']
  end
  n_first = source_ary.size if n_first > source_ary.size
  # main
  new_ary = []
  n_first.times { |i| new_ary << source_ary[i] }
  new_ary
end

a1 = mary
a2 = cutting_ary(rand(a1.size), a1)

p a1, a2
