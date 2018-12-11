class ContactMailer < ApplicationMailer
 

  def welcome_send(user)
    @user = user
    mail(to: user.email, subject: "Welcome !!")

  end
end
