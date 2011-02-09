class ApplicationController < ActionController::Base
  before_filter :authenticate_user!, :except => [:home]
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to user_session_url
  end
end
