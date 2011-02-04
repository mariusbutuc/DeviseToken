class ApplicationController < ActionController::Base
  before_filter :authenticate_user!#, :except => [:some_action_without_auth]
  protect_from_forgery
end
