class ContactMailer < ApplicationMailer
 

  def welcome_send(user)
    @user = user
    mail(to: user.email, subject: "Welcome !")
  end

  def event_confirmation(event, type)
    @event = event
    if type == "student"
    mail(to: event.student.email, subject: "Votre rendez-vous à bien été pris en compte")
    elsif type == "teacher"
    mail(to: event.teacher.email, subject: "Un nouvel élève rejoint votre classe !")
    end
  end

  def event_cancel(event, type)
    @event = event
    if type == "student"
    mail(to: event.student.email, subject: "Votre rendez-vous à bien été annulé")
    elsif type == "teacher"
    mail(to: event.teacher.email, subject: "Votre rendez-vous à bien été annulé")
    end
  end
end
