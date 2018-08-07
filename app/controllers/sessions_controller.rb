class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    gh = GithubService.new
    user = gh.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"],  params[:code])
    session[:token] = user.access_token
    session[:username] = gh.get_username
    redirect_to '/'
  end
end
