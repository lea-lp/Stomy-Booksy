class ContactMailer < ApplicationMailer
  def contact(teachers)

  @teachers = teachers

  mail(to: 'kasskq@gmail.com', subject: 'test')

  end

end
