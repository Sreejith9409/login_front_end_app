class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def index

  end

  def new

  end

  def create
    request = user_params(params)
    url = 'http://localhost:4001/api/v1/users'
    response = RestClient.post url, request
    response_hash = eval(response.body)
    if response_hash[:code] == 200
      flash[:notice] = "Created Successfully"
    else
      flash[:error] = response_hash[:body][:message]
    end
  end

  def update
    request = user_params(params)
    url = "http://localhost:4001/api/v1/users/#{params[:id]}"
    response = RestClient.post url, request
    response_hash = eval(response.body)
    if response_hash[:code] == 200
      flash[:notice] = "Updated Successfully"
    else
      flash[:error] = response_hash[:body][:message]
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params(params_hash)
      {first_name: params_hash["first_name"], last_name: params_hash["last_name"], login: params_hash["login"], email: params_hash["email"], age: params_hash["age"], gender: params_hash["gender"], mobile_number: params_hash["mobile_number"], home_number: params_hash["home_number"], work_number: params_hash["work_number"], address: params_hash["address"], city: params_hash["city"], state: params_hash["state"], country: params_hash["country"], pin_code: params_hash["pin_code"], crypted_password: params_hash["crypted_password"]}
    end
end
