require 'pony'
require 'io/console'

my_mail = '@mail.ru'

# На данный момент сервис mail.ru позволяет отправку писем внутри доменов Mailru-групп
# Установите пароль для отправки https://help.mail.ru/id/protection/external
password = '' # Удалён в целях бехопасности

test_mail = '@mail.ru'

subject = gets.chomp.encode('UTF-8')
subject ||= 'Привет из программы на руби'

print 'Body text:'
mail_body_text = gets.chomp.encode('UTF-8')

Pony.mail ({
  :subject => subject,
  :body => mail_body_text,
  :to => test_mail,
  :from => my_mail,
  :via => :smtp,
  :via_options => {
  :address => 'smtp.mail.ru',
  :port => '465',
  :tls => true,
  :user_name => my_mail,
  :password => password,
  :authentication => :plain
  }
})
