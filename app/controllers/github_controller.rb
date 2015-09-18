class GithubController < ApplicationController

  def user_info
    @user = Github.users.get user:'twhitacre'
    render json: Hash[@user]
  end

  def user_repos
    @repos = Github.repos.list user: 'twhitacre'
    render json: @repos
  end

end
