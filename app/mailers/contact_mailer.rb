class ContactMailer < ApplicationMailer
 

  def welcome_send(user)
    @user = user
    mail(to: user.email, subject: "Welcome !")
  end

  def event_confirmation(event, type)
    @event = event
    if type == "student"
    mail(to: event.student.email, subject: "Votre rendez-vous a été pris en compte")
    elsif type == "teacher"
    mail(to: event.teacher.email, subject: "Un élève a réservé un cours avec vous")
    end
  end

  def event_cancel(event, type)
    @event = event
    if type == "student"
    mail(to: event.student.email, subject: "Votre rendez-vous a été annulé")
    elsif type == "teacher"
    mail(to: event.teacher.email, subject: "Votre rendez-vous a été annulé")
    end
  end
end
