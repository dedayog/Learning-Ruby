DATA = '/data/quotes.txt'
unless File.exist?(__dir__+DATA)
  abort("File \'#{DATA}\' not found")
end

f = File.new(__dir__+'/data/quotes.txt','r:UTF-8')
content = f.read
puts content

f.close
