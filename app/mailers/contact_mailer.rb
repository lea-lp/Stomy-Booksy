class ContactMailer < ApplicationMailer
 

  def welcome_send(user)
    @user = user
    mail(to: user.email, subject: "Welcome !!")
  end

  def event_confirmation(user)
    @user = user
    mail(to: user.email, subject: "Votre rendez-vous à bien été pris en compte")
  end

  def event_cancel(user)
    @user = user
    mail(to: user.email, subject: "Votre rendez-vous à bien été annulé")
  end

end
