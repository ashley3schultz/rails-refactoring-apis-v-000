class RepositoriesController < ApplicationController
  def index
    gh = GithubService.new({"access_token" => session[:token]})
    github = GithubService.new({"access_token" => session[:token]})
    # response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    @repos_array = github.get_repos
  end

  def create
    gh = GithubService.new({"access_token" => session[:token]})
    gh.create_repo(params[:name])
    #response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    redirect_to '/'
  end
end
