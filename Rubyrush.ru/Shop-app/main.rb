require_relative '../win_stdin'
require_relative 'lib/productcollection'

DATADIR = '/data'

coll = ProductCollection.new(__dir__ + DATADIR)
p coll.sort(4, false)
puts
p coll.sort(1, true)
puts
p coll.sort(5, true)
# a.each {|e| p e.flatten}
# sort_by do |hsh| hsh.value
