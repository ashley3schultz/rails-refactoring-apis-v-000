class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    gh = GithubService.new
    gh = GithubService.new.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"],  params[:code])
    session[:token] = gh["access_token"]
    session[:username] = gh["login"]
    redirect_to '/'
  end
end
