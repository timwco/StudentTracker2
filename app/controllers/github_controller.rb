class GithubController < ApplicationController

  def user_info
    @user = Github.users.get user: params[:username]
    render json: Hash[@user]
  end

  def user_repos
    @repos = Github.repos.list user: params[:username]
    render json: @repos
  end

  def open_issues
    @open_issues = Github.issues.list user: 'tiy-atl-js-sept-2015',
      repo: 'Assignments',
      state: 'all',
      # labels: 'Complete',
      assignee: params[:username]
    render json: @open_issues
  end

end
