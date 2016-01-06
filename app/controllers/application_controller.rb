class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception
  before_action :check_auth

  def check_auth
    if params[:password]
      login_with_password(params[:password])
    end
  end

  def login_with_password(password)
    if password == ENV['PASSWORD_ADMIN']
      session[:user] = 'admin'
      return true
    elsif password == ENV['PASSWORD_TERMINAL']
      session[:user] = 'terminal'
      return true
    end

    false
  end

  def check_user(*roles)
    return true if roles.include?(session[:user])

    redirect_to :root, notice: 'Please login first!'
    false
  end
end
