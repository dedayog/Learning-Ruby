require_relative 'win_stdin'

def add_new_extension(ext) # !!! To do: move this method into Win_Stdin lib
  __dir__ + '/' + File.basename(__FILE__,'.*') + '.' + ext.to_s
end

DATA = 'data'
data_file = add_new_extension(DATA)

def get_hashtags(str)
  tags = []
  re = /#[\wА-Яа-я]+[\w\-А-Яа-я]*/m # describing TAG regexp
  str.scan(re) do |match|
      tags << match.to_s # fill ary with any founded
  end
  tags # return
end

# fill text array from file
if File.file?(data_file)
  f=File.new(data_file,'r:UTF-8')

  tagged_text = f.readlines(chomp:true)
  f.close
else
  tagged_text, use_stdin = [], true
end

phrase = -1
until phrase == '0'
  print 'Input string with hashtag(s), 0 for exit: '
  phrase = STDIN.gets.chomp
  tagged_text[0] = phrase if use_stdin
  phrase = tagged_text.sample if phrase == ''
  puts '-' * 40
  tags = get_hashtags(phrase).uniq
  puts "Phrase «#{phrase}» contains #{tags.size} uniq tags: #{tags}"
end
