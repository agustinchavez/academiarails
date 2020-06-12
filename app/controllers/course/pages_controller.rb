module Course
  class PagesController < CourseController

    def about
    end

    def contact
    end

    def gracias
      @name = params[:name]
      @email = params[:email]
      @message = params[:message]
      ActionMailer::Base.mail(:from => @email,
          :to => 'academiarails@gmail.com',
          :subject => "A new contact form message from #{@name}",
          :body => @message).deliver_now
    end


  end
end
