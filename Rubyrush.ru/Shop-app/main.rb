require_relative '../win_stdin'
require_relative 'lib/productcollection'

DATADIR = '/data'

coll = ProductCollection.new(__dir__ + DATADIR)
p coll.all_goodies
