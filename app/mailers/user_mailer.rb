class UserMailer < ActionMailer::Base
  default from: "Dias <mbadprojet@gmail.com>"

  def welcome_email(user)
    @user = user
    @url  = 'http://www.mbadias.com'
    mail(
    	to: @user.email, 
    	subject: "Bienvenue sur Dias"
    	)
  end
end
