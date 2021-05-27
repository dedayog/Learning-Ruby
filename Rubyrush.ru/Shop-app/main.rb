require_relative '../win_stdin'
require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/movie'
require_relative 'lib/productcollection'

b1= Book.new({stock_balance: 290, price: 42, name: 'Yey'})
b2= Book.new({name: 'Lord of the Rings', genre: 'epic novel', author: 'John R. Tolkien', price: 99, stock_balance: 13})
m1= Movie.new({name: 'Terminator', year: 1983, director: 'James F. Cameron', price: 24, stock_balance: 241})

puts b1.to_s
puts b2.to_s
puts m1.to_s

m1.update({year:1984})
puts m1

puts Book.create(Book::from_file)

puts Movie.create(Movie::from_file)
puts Movie.create([
'From Dusk till Dawn'  ,
' Robert A. Rodriguez',
1996,
28,
37
]  )

coll = ProductCollection.new(__dir__+'/data')
p coll.categories
puts coll.test
# puts Book.file_name
