class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session 
  include Authenticable # we include here so we can use its methods "current_user"
  # & "authenticate_with_token" in the users controller to  restrict access for some actions
  # like update 
end
