class HomeController < ApplicationController

  def index
    @current_user ||= Student.find(session[:user_id]) if session[:user_id]
    render layout: 'layouts/application', :locals => {:current_user => @current_user}
  end

end
