class ApplicationController < ActionController::Base
  protect_from_forgery

  layout 'author'

  class AuthorizationException < StandardError
  end

  rescue_from AuthorizationException do
    redirect_to new_user_session_path
  end

  protected
  def authenticate_user_or_author!
    unless user_signed_in? or author_signed_in?
      raise AuthorizationException.new
    end
  end


end
