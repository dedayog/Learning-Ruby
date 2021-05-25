# Pick a card
vals = %w(2 3 4 5 6 7 8 9 10 J Q K A)
# shirts = %w(diamonds spades hearts clubs)
shirts_image = %w(♦ ♣ ♥ ♠)
print '[ '
print "#{vals.sample}#{shirts_image.sample} "
print '] '

require 'digest/md5'
require 'digest/sha1'
require 'digest/sha2'

print 'Input string for \'encrypt\': '
string_for_encode = STDIN.gets.chomp
print 'MD5: '
p Digest::MD5.hexdigest(string_for_encode)
print 'SHA1: '
p Digest::SHA1.hexdigest(string_for_encode)
print 'SHA2: '
p Digest::SHA2.hexdigest(string_for_encode)
