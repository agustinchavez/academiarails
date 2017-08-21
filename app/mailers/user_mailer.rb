class UserMailer < ActionMailer::Base
  default from: "academiarails@gmail.com"


  def contact_form(email, name, message)
    @message = message
      mail(:from => email,
          :to => 'academiarails@gmail.com',
          :subject => "A new contact form message from #{name}")
  end


  def expire_email(user)
    mail(:to => user.email, :subject => "Subscription Cancelled")
  end
end