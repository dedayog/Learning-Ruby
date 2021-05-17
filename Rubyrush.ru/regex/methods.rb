require 'net/http'
require 'cgi'

def get_random_regexp_string
  patterns = %w(скат мать торт крик воск)
  pattern = patterns.sample
  letter = pattern.split('').sample
  return pattern.gsub(letter, '.')
end

def word_exist?(word)
  uri = "https://ru.wiktionary.org/wiki/" + URI.encode_www_form_component(word)
  wiktionary_page = Net::HTTP.get(URI(uri)).force_encoding('UTF-8')

  if wiktionary_page =~ /текст на данной странице отсутствует/
    # Если статьи про слово нет, значит надо вернуть false, такого слова нет
    return false
  else
    # Если такой текст на странице не найдет, значит статья есть и слово можно
    # засчитывать. Возвращаем true.
    return true
  end
end
