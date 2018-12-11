# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  def contact
    ContactMailer.contact(Teacher.all)


# pour test en console : 
    # ContactMailer.contact(Teacher.all).deliver_now

  end


end
