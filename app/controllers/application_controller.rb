class ApplicationController < ActionController::API
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session
  helper_method :current_user

  private

  def current_user
    @current_user ||= Student.find(session[:user_id]) if session[:user_id]
  end

end
