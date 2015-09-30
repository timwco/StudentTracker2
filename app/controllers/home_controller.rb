class HomeController < ApplicationController

  # Set Up Connection
  before_filter :github_connect
  def github_connect
    @github = Github.new do |config|
      config.client_id = ENV['GITHUB_CLIENT_ID']
      config.client_secret = ENV['GITHUB_SECRET']
    end
  end

  # Check user and get their Github info
  def index
    @current_user ||= Student.find(session[:user_id]) if session[:user_id]
    if @current_user
      @github_info = @github.users.get user: @current_user.github
      render layout: 'layouts/application', :locals => {:current_user => @current_user, :github_info => @github_info }
    else
      render template: 'home/login'
    end
  end

end
