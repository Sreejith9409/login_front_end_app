class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  
  def index
    response = RestClient.get "http://localhost:4001/api/v1/users"
    @users = JSON.parse(response)
  end

  def new
    # @user = User.new
  end
  
  def login
  end
  
  def create
    request = {"user_name"=> params[:email_or_login], "password"=> params[:password]}
    url = 'http://localhost:4001/api/v1/users/sign_in'
    response = RestClient.post url, request
    response_hash = eval(response.body)
    if response_hash[:code] == 200
      session[:user_id] = response_hash[:body][:user_id]
      redirect_to index_path
    else
      redirect_to root_url
    end
  end
  def page_requires_login
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
