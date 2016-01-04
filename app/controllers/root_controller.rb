class RootController < ApplicationController
  def index
    redirect_to items_path
  end

  def authenticate
    if params[:login][:username] == ENV['AUTH_USERNAME'] && params[:login][:password] == ENV['AUTH_PASSWORD']
      session[:logged_in] = true
      flash[:notice] = 'Successfully logged in!'
    end

    redirect_to :root
  end

  def logout
    session[:logged_in] = false
    redirect_to :root, notice: 'Successfully logged out!'
  end
end
