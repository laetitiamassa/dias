class UserMailer < ActionMailer::Base
  default from: "Dias <mbadprojet@gmail.com>"

  def welcome_email(user)
    @user = user
    @url  = 'http://mbadias.com/users/sign_up'
    mail(
    	to: @user.email, 
    	subject: "Bienvenue sur Dias"
    	)
  end
end
