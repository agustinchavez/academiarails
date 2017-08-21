class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("pepechuy@ejemplo.com", "Pepe", "Hola Mundo!")
  end
end