class HomeController < ApplicationController

  def index
    @current_user ||= Student.find(session[:user_id]) if session[:user_id]
    if @current_user
      @github_info = Github.users.get user: @current_user.github
      render layout: 'layouts/application', :locals => {:current_user => @current_user, :github_info => @github_info }
    else
      render template: 'home/login'
    end
  end

end
