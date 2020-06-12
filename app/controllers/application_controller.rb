class ApplicationController < ActionController::Base
  protect_from_forgery

  layout 'author'

  class AuthorizationException < StandardError
  end

  rescue_from AuthorizationException do
    render text: "Access Denied", status: :unauthorized
  end

  protected
  def authenticate_user_or_author!
    unless user_signed_in? or author_signed_in?
      raise AuthorizationException.new
    end
  end

end
