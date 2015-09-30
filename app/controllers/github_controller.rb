class GithubController < ApplicationController

  # Set Up Connection
  before_filter :github_connect
  def github_connect
    @github = Github.new do |config|
      config.client_id = ENV['GITHUB_CLIENT_ID']
      config.client_secret = ENV['GITHUB_SECRET']
    end
  end

  # Get Single User Info
  def user_info
    @user = @github.users.get user: params[:username]
    render json: Hash[@user]
  end

  # Get Single User's Repos
  def user_repos
    @repos = @github.repos.list user: params[:username]
    render json: @repos
  end

  # Get Single User's open issues
  def open_issues
    @open_issues = @github.issues.list user: APP_CONF['org'],
      repo: APP_CONF['repo'],
      state: 'all',
      # labels: 'Complete',
      assignee: params[:username]
    render json: @open_issues
  end

  # Get all members of organization
  def org_members
    @members = @github.orgs.members.list APP_CONF['org']
    render json: @members
  end

end
