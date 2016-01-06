class AuthenticationController < ApplicationController
  def authenticate
    if params[:login][:password] == ENV['PASSWORD_ADMIN']
      session[:user] = 'admin'
      flash[:notice] = 'Successfully logged in as admin!'
    elsif params[:login][:password] == ENV['PASSWORD_TERMINAL']
      session[:user] = 'terminal'
      flash[:notice] = 'Successfully logged in as terminal!'
    end

    redirect_to :root
  end

  def logout
    session[:user] = 'none'
    redirect_to :root, notice: 'Successfully logged out!'
  end
end
