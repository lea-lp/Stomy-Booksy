class ContactMailer < ApplicationMailer
 

  def welcome_send(user)
    @user = user
    mail(to: user.email, subject: "Welcome !!")
  end

  def event_confirmation(event)
    @event = event
    mail(to: event.teacher.email, subject: "Un nouvel élève rejoint votre classe !")
    mail(to: event.student.email, subject: "Votre rendez-vous à bien été pris en compte")
  end

  def event_cancel(event)
    @event = event
    mail(to: event.teacher.email, subject: "Votre rendez-vous à bien été annulé")
    mail(to: event.student.email, subject: "Votre rendez-vous à bien été annulé")
  end

end
