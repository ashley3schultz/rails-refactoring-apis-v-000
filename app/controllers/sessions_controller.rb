class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    gh = GithubService.new
    user =
    session[:token] = gh.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"],  params[:code])
    session[:username] = get_username
    redirect_to '/'
  end
end
