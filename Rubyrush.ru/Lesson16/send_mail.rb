require 'pony'
require 'io/console'

my_mail = '@mail.ru'

# На данный момент сервис mail.ru позволяет отправку писем внутри доменов Mailru-групп
# Установите пароль для отправки https://help.mail.ru/id/protection/external
password = '' # Удалён в целях бехопасности

print 'Введите адресата: '
test_mail = gets.chomp
test_mail = '@mail.ru' if test_mail == ''

print 'Введите тему: '
subject = gets.chomp.encode('UTF-8')
subject = 'Привет из программы на руби' if subject == ''

print 'Введите текст письма: '
mail_body_text = gets.chomp
mail_body_text = 'Тестовое сообщение, проверка Pony.mail' if mail_body_text == ''
mail_body_text = mail_body_text.encode('UTF-8')

begin

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

  puts 'Письмо отправлено'

rescue
  puts 'Не удалось отправить письмо'
ensure
  puts 'Попытка отправки письма закончена'
  # p test_mail, subject, mail_body_text
end
