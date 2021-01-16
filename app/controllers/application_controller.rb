class ApplicationController < ActionController::Base
  helper_method :logged_in?
  before_action :authorized

  def authorized
    if logged_in?
      return true
    else
      redirect_to '/'
    end
  end

  def logged_in?
    session[:user_id].present?
  end
end
